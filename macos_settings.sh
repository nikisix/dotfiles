#!/usr/bin/env bash
#
# Take a look at these for other ideas:
# https://github.com/dsdstudio/dotfiles/blob/master/.osx
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://gist.github.com/meleyal/5890865
# https://github.com/connorcimowsky/dotfiles/blob/master/defaults.sh
# https://www.defaults-write.com/speed-up-macos-high-sierra/
# https://github.com/herrbischoff/awesome-osx-command-line

set -o errexit
set -o nounset
set -o pipefail

# Install fonts
open Inconsolata/Inconsolata-Bold.ttf
open Inconsolata/Inconsolata-Regular.ttf
# Setup apps
for app in ./apps/*/; do
    "${app}"/setup.sh
done
# Disable iTunes
sudo chmod -x /Applications/iTunes.app
# Set preferred macOS and app settings. Probably worth looking at what the defaults are from the new computer so we can
# drop them here.
#
# Set network name
scutil --set HostName JacobHayes
scutil --set LocalHostName JacobHayes
scutil --set ComputerName JacobHayes
# '-g' is short for the 'NSGlobalDomain' domain
defaults delete -g NSUserDictionaryReplacementItems
defaults write -g AppleActionOnDoubleClick -string 'Maximize'
defaults write -g AppleFirstWeekday -dict 'gregorian' -int 2
defaults write -g AppleInterfaceStyle -string 'Dark'
defaults write -g AppleLanguages -array -string 'en-US' -string 'es-US'
defaults write -g AppleLocale -string 'en_US'
defaults write -g AppleMeasurementUnits -string 'Centimeters'
defaults write -g AppleMetricUnits -bool true
defaults write -g ApplePressAndHoldEnabled -bool false # Allow key repeat
defaults write -g AppleShowScrollBars -string 'WhenScrolling'
defaults write -g AppleTemperatureUnit -string 'Celsius'
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2
defaults write -g NSWindowResizeTime -float 0.0
defaults write -g com.apple.springing.delay -float 0.5
defaults write -g com.apple.trackpad.scaling -float 1.5
# Dashboard
defaults write com.apple.dashboard dashboard-enabled-state -int 1 # Disabled
# Dock
defaults delete com.apple.dock persistent-apps # Add things manually
defaults delete com.apple.dock persistent-others # Add things manually
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock largesize -float 50
defaults write com.apple.dock expose-group-apps -bool true
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock mineffect -string 'scale'
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock pinning -string 'middle'
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
defaults write com.apple.dock tilesize -float 25
# Finder
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRecentTags -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowSidebar -bool true
defaults write com.apple.finder ShowTabView -bool false
defaults write com.apple.finder ShowTabView -bool true
# Battery Menubar
defaults write com.apple.menuextra.battery ShowPercent -string 'YES'
# Clock Menubar
defaults write com.apple.menuextra.clock DateFormat -string 'EEE MMM d  H:mm'
# Share menu
defaults write com.apple.preferences.extensions.ShareMenu displayOrder -array -string 'com.apple.share.AirDrop.send'
defaults write com.apple.preferences.extensions.ShareMenu userHasOrdered -bool true
# Menu bar items
defaults write com.apple.systemuiserver "NSStatusItem Visible Siri" -bool false
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.bluetooth" -bool true
defaults write com.apple.systemuiserver menuExtras -array \
    "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
    "/System/Library/CoreServices/Menu Extras/Battery.menu" \
    "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
    "/System/Library/CoreServices/Menu Extras/Clock.menu" \
    "/System/Library/CoreServices/Menu Extras/User.menu" \
    "/System/Library/CoreServices/Menu Extras/Volume.menu"
# Accessability - aka zoom and invert
defaults write com.apple.universalaccess closeViewDesiredZoomFactor -float 2
defaults write com.apple.universalaccess closeViewFlashScreenOnNotificationEnabled -bool true
# Spaces
defaults write com.apple.spaces spans-displays -bool false
# Postico
defaults write at.eggerapps.Postico ShowSidebar -bool true
defaults write at.eggerapps.Postico PreferTableListView -bool true

echo "Don't forget to:"
echo "- disable guest account"
echo "- enable/verify filevault encryption"
echo ""
echo "Waiting..."
read -r
