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

defaults write http://com.apple.dt.Xcode ShowDVTDebugMenu -bool YES

# Dock

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

ln -s $PWD/macos/com.marcoarment.quitter.plist $HOME/Library/Preferences/com.marcoarment.quitter.plist
