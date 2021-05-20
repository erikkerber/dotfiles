# Uncomment this if the modal indicator becomes annoying
#function fish_mode_prompt; end

# Path to dotfiles repo
set -x DOTFILES (dirname (readlink "$HOME/.config"))

# Target stuff
set -x DRONE_SERVER drone6.target.com

#set -gx PATH \$PATH ~/
set -gx PATH $HOME/.bin $PATH
# abrew
set -gx PATH /opt/homebrew/bin $PATH
# ibrew
set -gx PATH $HOME/usr/local/sbin $PATH
# go
set -gx PATH $HOME/go/bin $PATH
# slack
set -gx PATH $HOME/dev/slack-objc/bin $PATH
# rust
set -Ua fish_user_paths $HOME/.cargo/bin
# FZF

set -gx FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*" --ansi'
set -gx FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude .git --color=always'
set -Ux FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

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

## rbenv
. (rbenv init -|psub)

# Special one-off for scmpuff
source $DOTFILES/**/fish/conf.d/scmpuff.fish

set -g fish_user_paths "/opt/homebrew/opt/node@14/bin" $fish_user_paths
