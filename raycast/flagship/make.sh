#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Make
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon 🎯
# @raycast.currentDirectoryPath ~/dev/ios
# @raycast.packageName Flagship
# @raycast.argument1 { "type": "text", "placeholder": "target" }

input=${1}

if [[ "$input" =~ "b" ]]; then
	input="bootstrap"
elif [[ "$input" =~ "fd" ]]; then
	input = "fix-dependencies"
fi

make $input