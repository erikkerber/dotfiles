#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Current Finder Directory in Nova
# @raycast.mode silent
# @raycast.packageName Navigation
#
# Optional parameters:
# @raycast.icon 🖥
#
# Documentation:
# @raycast.description Open current Finder directory in Nova
# @raycast.author Brentley Jones
# @raycast.authorURL https://github.com/brentleyjones
tell application "Finder"
	set pathList to (quoted form of POSIX path of (folder of the front window as alias))
	do shell script "nova " & pathList
end tell