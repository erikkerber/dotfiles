#!/bin/bash

files=(\
  bin \
  Brewfile \
  Brewfile.mac \
  config \
  curlrc \
  gemrc \
  git_template \
  gitattributes \
  gitconfig \
  gitignore \
  haskeline \
  lldb_commands \
  lldbinit \
  raycast \
  tmux \
  tmux.conf \
  vim \
  vimrc \
  xvimrc \
  zshrc \
)

custom_path() {
  for i in "${!PATHS[@]}"
  do
    if [[ "$1" == "$i" ]]; then
      return 0
    fi
  done

  return 1
}

new_path() {
  echo "$HOME/.$1"
}

# Links the passed filename to its new location
link() {
  local filename="$1"

  if [[ ! -e "$filename" ]]; then
    echo "$filename doesn't exist"
    return
  fi

  target="$(new_path "$filename")"
  if [[ ! -e "$target" ]]; then
    echo "Linking $filename to $target"
    ln -s "$PWD/$filename" "$target"
  fi
}

# Delete the linked file
unlink() {
  target="$(new_path "$1")"

  if [ -e "$target" ]; then
    echo "Removing $target"
    rm "$target"
  fi
}

# Loops through and link all files without links
install_links() {
  for file in "${files[@]}"
  do
    link "$file"
  done
}

run_scripts() {
  ./iterm/import-scheme.sh iterm/schemes/*
  ./macos/defaults.sh
}

# Function to remove all linked files
remove_links() {
  for file in "${files[@]}"
  do
    unlink "$file"
  done
}

# Fuction to print the usage and exit when there's bad input
die() {
  echo "Usage ./manage.sh {install|remove|clean}"
  exit 1
}

# Make sure there is 1 command line argument
if [[ $# != 1 ]]; then
  die
fi

# Check whether the user is installing or removing
if [[ $1 == "install" ]]; then
  install_links
  run_scripts
elif [[ $1 == "remove" ]]; then
  remove_links
elif [[ $1 == "clean" ]]; then
  find -L "$HOME" -maxdepth 1 -type l -exec rm -i {} \;
else
  die
fi
