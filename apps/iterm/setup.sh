#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# Add custom profiles
ln -s "${PWD}/profiles.json" "${HOME}/Library/Application Support/iTerm2/DynamicProfiles/profiles.json"
# Set the 'dark' theme as the default
defaults write com.googlecode.iterm2 "Default Bookmark Guid" -string "2AE2AB65-51BB-4654-9E04-B6876D3A57E5"
# Generic display tweaks
defaults write com.googlecode.iterm2 WindowNumber -bool False # Remove window number from title
defaults write com.googlecode.iterm2 UseBorder -bool true # Fill gap from fixed-width font
defaults write com.googlecode.iterm2 EnableDivisionView -bool false # Don't show line under status bar
# Enable automatic updates and set to beta channel
defaults write com.googlecode.iterm2 CheckTestRelease -bool true
defaults write com.googlecode.iterm2 SUAutomaticallyUpdate -bool true
defaults write com.googlecode.iterm2 SUEnableAutomaticChecks -bool true
defaults write com.googlecode.iterm2 SUFeedURL -string "https://iterm2.com/appcasts/testing.xml?shard=22"
