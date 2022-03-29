#!/usr/bin/env bash

set -euo pipefail

if [[ ! -e ./manage.sh ]]; then
  echo "This script must be run from the root of the dotfiles repo"
  exit 1
fi

# ~/.osx — http://mths.be/osx
# Watch for changes in files with either of
#  sudo fs_usage | grep plist
#  sudo opensnoop | grep plist
# Useful reference: http://www.hcs.harvard.edu/~jrus/Site/Cocoa%20Text%20System.html

# Enables press-and-hold for nav in Vim + VSCode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Xcode

defaults write com.apple.dt.Xcode IDEIndexerActivityShowNumericProgress -bool true
defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool YES
defaults write com.apple.dt.Xcode ShowDVTDebugMenu -bool YES
#sudo touch /Applications/Xcode.app/Contents/Developer/AppleInternal/Library/Xcode/AppleInternal.plist
echo "%admin ALL=NOPASSWD: /usr/bin/xcode-select,/usr/bin/xcodebuild -runFirstLaunch" | sudo tee /etc/sudoers.d/xcode

# Additional counterparts
defaults write com.apple.dt.Xcode IDEAdditionalCounterpartSuffixes -array-add "ViewModel" "View" "Screen"

# Don't open the last open project on launch
defaults write com.apple.dt.Xcode ApplePersistenceIgnoreState -bool YES

# Dock

# Autohide quickly
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0.0
defaults write com.apple.dock autohide-time-modifier -float 0.0

defaults write com.apple.dock autohide-time-modifier -float 0.2

# Disable 3-finger gesture
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

if command -v dockutil; then
  dockutil --remove all

  dockutil --add "/Applications/Safari.app"
  dockutil --add "/System/Applications/Messages.app"
  dockutil --add "/Applications/Alacritty.app"
  dockutil --add "/Applications/OmniFocus.app"
  dockutil --add "/Applications/Slack.app"

  dockutil --add "/Applications" --view list --display folder --sort name
  dockutil --add "$HOME/Downloads" --view grid --display stack --sort dateadded
else
  echo "Install dockutil via brew bundle first"
fi

# Quitter
ln -s $PWD/macos/com.marcoarment.quitter.plist $HOME/Library/Preferences/com.marcoarment.quitter.plist

