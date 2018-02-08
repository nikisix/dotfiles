#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

mkdir -p "${HOME}/Library/Application Support/Spectacle"
ln -fs "${PWD}/shortcuts.json" "${HOME}/Library/Application Support/Spectacle/Shortcuts.json"
