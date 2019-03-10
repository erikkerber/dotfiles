set bindings "$HOME/Library/Developer/Xcode/UserData/KeyBindings"
rm -f "$bindings/custom.idekeybindings"
mkdir -p "$bindings"
ln -s "$DOTFILES/xcode/custom.idekeybindings" "$bindings"

set colors "$HOME/Library/Developer/Xcode/UserData/FontAndColorThemes"
rm -f "$colors/panic.xccolortheme"
mkdir -p "$colors"
ln -s "$DOTFILES/xcode/panic.xccolortheme" "$colors"
