"""Iterate through ./pyradio-titles.log and parse the lines.
loading a python dictionary keyed on the playlist and valued on the song title."""
from pprint import pprint
import os
import re
import sys
from typing import Dict, List

def parse_titles(log_file: str) -> Dict[str, List]:
    """Parse the log file and return a dictionary of playlists and titles."""
    playlists: Dict[str, List] = {}
    with open(log_file, 'r') as f:
        playlist_name = None
        for line in f:
            # Skip empty lines
            if not line.strip():
                continue
            # Match the line with the regex
            playlist_match = re.match(r'^.* \| >>> Station: (.*)$', line)
            if playlist_match:
                playlist_name = playlist_match.group(1).strip()
                # Create a new playlist if it doesn't exist
                if playlist_name not in playlists:
                    playlists[playlist_name] = list()
            title_match = re.match(r'^.* \|     (.*) \(LIKED\)$', line)
            if title_match:
                title = title_match.group(1).strip()
                # Add the title to the playlist
                playlists[playlist_name].append(title)
    return playlists

log_file = './pyradio-titles.log'

# Check if the log file exists
if not os.path.exists(log_file):
    print(f"Log file {log_file} does not exist.")
    sys.exit(1)

playlists = parse_titles(log_file)
pprint(playlists)
with open('./parsed-pyradio-titles.txt', 'w') as f:
    for playlist, titles in playlists.items():
        f.write(f"\n{playlist}:\n")
        for title in titles:
            f.write(f"\t{title}\n")
