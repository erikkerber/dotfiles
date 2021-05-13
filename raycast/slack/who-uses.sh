#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Who Uses
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon slack.png
# @raycast.currentDirectoryPath ~/dev/slack-objc
# @raycast.packageName Slack
# @raycast.argument1 { "type": "text", "placeholder": "//Modules/Features/AV" }

./bazel query --notool_deps --nonodep_deps --noshow_progress -- \
  	'let module = '${1}' in
		filter(".*(?<!\..*)$", 
	  		kind(
			  "swift_library|ios_application", 
		  		rdeps(
			  		kind(ios_application, //App/...), 
			  		$module
				)
		)
	)'