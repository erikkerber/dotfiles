#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Who Uses
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon flagship.png
# @raycast.currentDirectoryPath ~/dev/ios
# @raycast.packageName Flagship
# @raycast.argument1 { "type": "text", "placeholder": "//Apps/Flagship" }

tools/bazelisk query --notool_deps --nonodep_deps --noshow_progress -- \
  	'let module = '${1}' in
		filter(".*(?<!\..*)$", 
	  		kind(
			  "swift_library|ios_application", 
		  		rdeps(
			  		kind(ios_application, //src/Apps/...), 
			  		$module
				)
		)
	)'