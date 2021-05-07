#!/usr/bin/env bash

# Download the default iTerm configuration file if not exists
if [[ ! -s "$HOME/Library/Preferences/com.googlecode.iterm2.plist" ]]; then
	echo "Downloading the default iTerm configuration file ..."
	echo_and_eval "curl -fL# -o \"\$HOME/Library/Preferences/com.googlecode.iterm2.plist\" \\
			https://github.com/gnachman/iTerm2/raw/master/plists/iTerm2.plist"
fi

# Create 'Custom Color Presets' entry if not exists
if ! /usr/libexec/PlistBuddy -c 'Print "Custom Color Presets"' \
	"$HOME/Library/Preferences/com.googlecode.iterm2.plist" &>/dev/null; then
	echo "Creating 'Custom Color Presets' entry ..."
	echo_and_eval "/usr/libexec/PlistBuddy \\
				-c 'Add \"Custom Color Presets\" dict' \\
				\"\$HOME/Library/Preferences/com.googlecode.iterm2.plist\""
fi

# Import color schemes for iTerm
count=0
for filename in "$@"; do
	count=$((count + 1))
	if [[ ! -f "$filename" ]]; then
		echo "File not found: \"$filename\". Skip." >&2
		continue
	elif ! (echo "$filename" | grep -qF '.itermcolors'); then
		echo "Invalid iTerm color scheme file: \"$filename\". Skip." >&2
		continue
	fi

	# Format the scheme name (capitalized)
	name="$(
		echo "$filename" |
			sed -E 's|.*/([^/]*)\.itermcolors|\1|g' |
			sed -E 's/([0-9a-zA-Z])_([0-9a-zA-Z])/\1 \2/g; s/([0-9a-zA-Z])-([0-9a-zA-Z])/\1 \2/g;'
	)"
	name=($name)
	name="${name[*]^}"
	name="$(
		echo "$name" |
			sed -E 's| In | in |g; s| Of | of |g; s| And | and |g; s| V([0-9]+)$| v\1|g'
	)"

	# Import the color scheme
	echo "Importing color scheme ($count/$#): $name (\"$filename\") ..."
	if /usr/libexec/PlistBuddy -c "Print \"Custom Color Presets:$name\"" \
		"$HOME/Library/Preferences/com.googlecode.iterm2.plist" &>/dev/null; then
		# If already installed
		# Delete first and reinstall
		eval "/usr/libexec/PlistBuddy \\
				-c 'Delete \"Custom Color Presets:$name\"' \\
				-c 'Add \"Custom Color Presets:$name\" dict' \\
				-c 'Merge \"$filename\" \"Custom Color Presets:$name\"' \\
				\"\$HOME/Library/Preferences/com.googlecode.iterm2.plist\""
	else
		# If not installed
		# Install directly
		eval "/usr/libexec/PlistBuddy \\
				-c 'Add \"Custom Color Presets:$name\" dict' \\
				-c 'Merge \"$filename\" \"Custom Color Presets:$name\"' \\
				\"\$HOME/Library/Preferences/com.googlecode.iterm2.plist\""
	fi
done
