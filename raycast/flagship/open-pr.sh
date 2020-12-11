#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title PR
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon flagship.png
# @raycast.packageName Flagship
# @raycast.argument1 { "type": "text", "placeholder": "pr" }

open "https://git.target.com/mobile-apps/ios/pull/${1}"
