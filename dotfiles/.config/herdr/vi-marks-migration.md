# vi-marks: local plugin → published plugin

The vi-marks plugin currently runs as a **local link** from this dotfiles repo
while its functionality is being finalized. The published copy lives at
<https://github.com/nikisix/herdr-vi-marks> (listed on herdr.dev/plugins via
the `herdr-plugin` GitHub topic).

| | Local (now) | Published (later) |
| --- | --- | --- |
| Plugin id | `local.vi-marks` | `nikisix.vi-marks` |
| Source | `~/dotfiles/dotfiles/.config/herdr/local-plugins/vi-marks/` | `nikisix/herdr-vi-marks` on GitHub |
| Registered with | `herdr plugin link <path>` | `herdr plugin install nikisix/herdr-vi-marks` |
| Keybinding commands | `local.vi-marks.prompt-set` / `prompt-jump` | `nikisix.vi-marks.prompt-set` / `prompt-jump` |

The keybindings are the two `[[keys.command]]` blocks under `# MARKS` at the
end of `config.toml`.

## Switching over

### 1. Push finished changes to the published repo

The two copies differ on purpose in a few places. Carry over everything
**except** these when syncing `marks.py` and `herdr-plugin.toml`:

- Plugin id: `local.vi-marks` (manifest `id` and the `--plugin` argument in
  `marks.py`'s `prompt` branch) → `nikisix.vi-marks`.
- `min_herdr_version`: published is `"0.9.5"`, the only version `pane.scroll`
  was tested on.
- `platforms`: published is `["linux", "macos"]`, since the `pane.scroll` call
  uses a Unix socket.
- `description`: published is the newer wording.

```sh
cd ~/code/herdr-vi-marks        # clone it again if missing
cp ~/dotfiles/dotfiles/.config/herdr/local-plugins/vi-marks/marks.py .
sed -i 's/"local\.vi-marks"/"nikisix.vi-marks"/' marks.py
git diff                        # review; port any manifest changes by hand
# bump `version` in herdr-plugin.toml, update README.md if behavior changed
git commit -am "..." && git push
```

### 2. Swap the registrations

```sh
herdr plugin unlink local.vi-marks
herdr plugin install nikisix/herdr-vi-marks --yes   # or `herdr plugin update nikisix.vi-marks` if already installed
```

### 3. Point the keybindings at the new id

```sh
sed -i 's/local\.vi-marks\./nikisix.vi-marks./' ~/dotfiles/dotfiles/.config/herdr/config.toml
herdr server reload-config
herdr plugin list                # expect only nikisix.vi-marks
```

### 4. Remove the local copy

```sh
cd ~/dotfiles
git rm -r dotfiles/.config/herdr/local-plugins/vi-marks
rm -r ~/.config/herdr/local-plugins/vi-marks   # per-file symlinks made by setup.sh's `cp -srf`
```

Then add the `setup.sh` snippet below and delete this file.

## Installing automatically on a new system

herdr is installed from Homebrew on this machine but is **not** in
`requirements/Brewfile` yet. Add it:

```ruby
brew "herdr"
```

`setup.sh` deploys `config.toml` (with the keybindings) through
`cp -srf dotfiles/.[^.]* ~/`, but herdr plugins have to be registered with the
herdr CLI. Add a step to `setup.sh` **after** "Linking dotfiles to ~/". herdr
can install and link plugins while no herdr server is running, so this works
on a fresh machine.

**While the plugin is still local** (before switching over):

```sh
echo "Linking herdr plugins"
if hash herdr 2>/dev/null; then
    herdr plugin link "${PWD}/dotfiles/.config/herdr/local-plugins/vi-marks"
fi
```

**After switching over:**

```sh
echo "Installing herdr plugins"
if hash herdr 2>/dev/null; then
    herdr plugin install nikisix/herdr-vi-marks --yes
fi
```

Notes:

- Add `--ref <tag-or-commit>` to pin a version. Without it, the default branch
  is installed.
- `herdr plugin update --yes` later refreshes every GitHub-installed plugin.
- Plugins are registered per user and shared by every herdr session, so this
  runs once per machine.
- `python3` must be on `PATH`. macOS's Command Line Tools provide it.
- Running `herdr plugin install` on a machine that already has the plugin
  reinstalls the same commit, so the step is safe to re-run.
