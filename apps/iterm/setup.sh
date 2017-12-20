#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# Add custom profiles
ln -s "${PWD}/profiles.json" "${HOME}/Library/Application Support/iTerm2/DynamicProfiles/profiles.json"
# Need to add download Solarized Light and Dark and add those as profiles. Add Dark as the default guid \/
# Select the default profile
defaults write com.googlecode.iterm2.plist "Default Bookmark Guid" -string "guid from profiles.json"
# Generic display tweaks
defaults write com.googlecode.iterm2.plist WindowNumber -bool False # Remove window number from title
defaults write com.googlecode.iterm2.plist UseBorder -bool true # Fill gap from fixed-width font
defaults write com.googlecode.iterm2.plist EnableDivisionView -bool false # Don't show line under status bar
# Enable automatic updates and set to beta channel
defaults write com.googlecode.iterm2.plist CheckTestRelease -bool true
defaults write com.googlecode.iterm2.plist SUAutomaticallyUpdate -bool true
defaults write com.googlecode.iterm2.plist SUEnableAutomaticChecks -bool true
defaults write com.googlecode.iterm2.plist SUFeedURL -string "https://iterm2.com/appcasts/testing.xml?shard=22"
