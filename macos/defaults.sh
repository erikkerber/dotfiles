#!/usr/bin/env bash

# ~/.osx — http://mths.be/osx
# Watch for changes in files with either of
#  sudo fs_usage | grep plist
#  sudo opensnoop | grep plist
# Useful reference: http://www.hcs.harvard.edu/~jrus/Site/Cocoa%20Text%20System.html

killall System\ Preferences

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing 'sudo' time stamp until '.osx' has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Enables press-and-hold for nav in Vim + VSCode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false


# Xcode

defaults write com.apple.dt.Xcode IDEIndexerActivityShowNumericProgress -bool true

defaults write http://com.apple.dt.Xcode ShowDVTDebugMenu -bool YES
