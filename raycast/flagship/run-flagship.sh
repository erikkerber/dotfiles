#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Run Flagship
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon flagship.png
# @raycast.currentDirectoryPath ~/dev/ios
# @raycast.packageName Flagship
# @raycast.argument1 { "type": "text", "placeholder": "//Apps/Flagship" }

export DEVELOPER_DIR=$(xcode-select -p)
tools/bazelisk run --config=xcode_debug --noshow_progress -- ${1}