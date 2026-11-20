import json
import os
import socket
import string
import subprocess
import sys
from pathlib import Path

herdr = os.environ.get("HERDR_BIN_PATH", "herdr")
state_dir = Path(os.environ["HERDR_PLUGIN_STATE_DIR"])
state_file = state_dir / "marks.json"

def run_herdr(*args, check=True):
    res = subprocess.run([herdr, *args], capture_output=True, text=True, check=check)
    return res.stdout

def get_active_pane_ids():
    try:
        raw = run_herdr("pane", "list")
        data = json.loads(raw)
        ids = set()

        def walk(node):
            if isinstance(node, dict):
                for k in ("id", "pane_id"):
                    if isinstance(node.get(k), str) and node[k]:
                        ids.add(node[k])
                for v in node.values():
                    walk(v)
            elif isinstance(node, list):
                for item in node:
                    walk(item)

        walk(data)
        return ids if ids else None
    except Exception:
        return None

def load_and_prune_marks():
    marks = json.loads(state_file.read_text()) if state_file.exists() else {}
    active_ids = get_active_pane_ids()
    if active_ids is not None:
        pruned = {pid: m for pid, m in marks.items() if pid in active_ids}
        if len(pruned) != len(marks):
            marks = pruned
            save_marks(marks)
    return marks

def save_marks(marks):
    state_dir.mkdir(parents=True, exist_ok=True)
    state_file.write_text(json.dumps(marks, indent=2))

def call_api(method, params):
    # pane.scroll has no CLI subcommand, so talk to the socket API directly
    with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as sock:
        sock.connect(os.environ["HERDR_SOCKET_PATH"])
        sock.sendall((json.dumps({"id": "line-marks", "method": method, "params": params}) + "\n").encode())
        buf = b""
        while not buf.endswith(b"\n"):
            chunk = sock.recv(65536)
            if not chunk:
                break
            buf += chunk
    res = json.loads(buf)
    if "error" in res:
        raise RuntimeError(res["error"].get("message", res["error"]))
    return res["result"]

def get_pane_state(pid):
    data = json.loads(run_herdr("pane", "get", pid))
    pane = data.get("result", {}).get("pane", data)
    scroll = pane.get("scroll", {})
    return scroll.get("offset_from_bottom", 0), scroll.get("max_offset_from_bottom", 0)

def read_single_char():
    if os.name == "nt":
        import msvcrt
        ch = msvcrt.getwch()
        return "" if ch in ("\x03", "\x1b") else ch
    import termios
    import tty
    fd = sys.stdin.fileno()
    old = termios.tcgetattr(fd)
    try:
        tty.setraw(fd)
        ch = sys.stdin.read(1)
        return "" if ch in ("\x03", "\x1b") else ch
    finally:
        termios.tcsetattr(fd, termios.TCSADRAIN, old)

def execute_mark(pid, mode, key):
    marks = load_and_prune_marks()
    pane_marks = marks.setdefault(pid, {})
    offset, max_offset = get_pane_state(pid)
    current_from_top = max(0, max_offset - offset)

    if mode == "set":
        if key not in string.ascii_lowercase:
            return
        pane_marks[key] = current_from_top
        save_marks(marks)
        run_herdr("notification", "show", f"Mark '{key}' set (line {current_from_top})")

    elif mode == "jump":
        mark_key = "_prev" if key == "'" else key
        if mark_key not in pane_marks:
            label = "Previous position" if mark_key == "_prev" else f"Mark '{mark_key}'"
            run_herdr("notification", "show", f"{label} not set")
            return

        target_from_top = min(max_offset, max(0, pane_marks[mark_key]))
        if target_from_top == current_from_top:
            run_herdr("notification", "show", f"Already at mark '{key}' (line {target_from_top})")
            return

        pane_marks["_prev"] = current_from_top
        save_marks(marks)

        # Set the scrollback viewport directly; send-keys would go to the
        # pane's program, not to herdr's copy mode
        try:
            call_api("pane.scroll", {"pane_id": pid, "offset_from_bottom": max_offset - target_from_top})
        except Exception as e:
            run_herdr("notification", "show", f"Jump error: {e}")
            return

        run_herdr("notification", "show", f"Jumped to '{key}' (line {target_from_top})")

cmd = sys.argv[1] if len(sys.argv) > 1 else ""

if cmd == "prompt":
    mode = sys.argv[2] if len(sys.argv) > 2 else "set"
    pid = os.environ.get("HERDR_PANE_ID")
    if not pid:
        run_herdr("notification", "show", "Error: HERDR_PANE_ID not set")
        sys.exit(1)

    res = subprocess.run(
        [
            herdr, "plugin", "pane", "open",
            "--plugin", "local.line-marks",
            "--entrypoint", "key-reader",
            "--placement", "popup",
            "--env", f"MARK_MODE={mode}",
            "--env", f"TARGET_PANE_ID={pid}",
        ],
        capture_output=True,
        text=True,
    )
    if res.returncode != 0:
        run_herdr("notification", "show", f"Popup error: {res.stderr.strip()}")

elif cmd == "read-key":
    mode = os.environ.get("MARK_MODE", "")
    pid = os.environ.get("TARGET_PANE_ID", "")
    prompt_text = "Set mark (a-z): " if mode == "set" else "Jump mark (a-z / '): "
    sys.stdout.write(prompt_text)
    sys.stdout.flush()
    ch = read_single_char()
    if ch and pid:
        execute_mark(pid, mode, ch)
