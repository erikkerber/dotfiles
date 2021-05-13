#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title PR
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon slack.png
# @raycast.packageName Slack
# @raycast.argument1 { "type": "text", "placeholder": "pr" }

open "https://github.com/tinyspeck/slack-objc/pull/${1}"
