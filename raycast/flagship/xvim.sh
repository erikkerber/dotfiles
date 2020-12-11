#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title XVim Setup
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon flagship.png
# @raycast.packageName Flagship

export SUDO_ASKPASS="./askpass.sh"
sudo -A codesign -f -s XcodeSigner $(xcode-select -p | sed 's/Contents.*//g')
