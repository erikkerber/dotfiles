#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Build Slack
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon slack.png
# @raycast.currentDirectoryPath ~/dev/slack/slack-objc
# @raycast.packageName Slack

bazel build -- //App:Slack
