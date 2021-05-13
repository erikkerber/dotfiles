#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Generate Slack Bazel
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon slack.png
# @raycast.currentDirectoryPath ~/dev/slack-objc
# @raycast.packageName Slack
# @raycast.argument1 { "type": "text", "placeholder": "xc" }

shopt -s nocasematch

input=${1}

# Anything "xc...", assume I was maching XcodeBuild
if [[ "$input" =~ "xc" ]]; then
	label="SlackXcode"
else
	label="SlackBazel"
fi

./bazel run --config=development -- //project-gen:${label}