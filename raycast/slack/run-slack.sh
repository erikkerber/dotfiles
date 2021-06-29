#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Build Slack
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon slack.png
# @raycast.currentDirectoryPath ~/dev/slack-objc
# @raycast.packageName Slack

bazel run --config=development --noshow_progress -- //App:Slack