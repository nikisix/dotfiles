#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

ln -s "${PWD}/shortcuts.json" "${HOME}/Library/Application Support/Spectacle/Shortcuts.json"
