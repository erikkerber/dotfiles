set fish_greeting "Hi"

# Uncomment this if the modal indicator becomes annoying
#function fish_mode_prompt; end

# Path to dotfiles repo
set -x DOTFILES (dirname (readlink "$HOME/.config"))

## rbenv
status --is-interactive; and source (rbenv init -|psub)

#set -gx PATH \$PATH ~/
set -gx PATH ~/.bin $PATH

set -x EDITOR nvim

# Source all fish files
for file in $DOTFILES/**/fish/*.fish
  switch $file
  case "*config.fish"
    # Don't source the config itself
  case '*'
    source $file
  end
end

# Special one-off for scmpuff
source $DOTFILES/**/fish/conf.d/scmpuff.fish
