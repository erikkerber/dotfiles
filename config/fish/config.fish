# Uncomment this if the modal indicator becomes annoying
#function fish_mode_prompt; end

# Path to dotfiles repo
set -x DOTFILES (dirname (readlink "$HOME/.config"))

#set -gx PATH \$PATH ~/
set -gx PATH $HOME/.bin $PATH
# abrew
set -gx PATH /opt/homebrew/bin $PATH
# go
set -gx PATH $HOME/go/bin $PATH
# slack
set -gx PATH $HOME/Developer/slack/slack-objc/bin $PATH

set -gx PATH $HOME/.local/bin $PATH
# rust
set -Ua fish_user_paths $HOME/.cargo/bin
#openjdk
fish_add_path /opt/homebrew/opt/openjdk/bin
set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk/include"
# gpg
set -gx GPG_TTY (tty)

# FZF
set -gx FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*" --ansi'
set -gx FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude .git --exclude carthage'
set -Ux FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# git-pile
set -gx GIT_PILE_PREFIX ekerber/
set -gx GIT_PILE_USE_PR_TEMPLATE 1

set -gx EDITOR nvim

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
set -x PATH $HOME/.rbenv/bin $PATH
rbenv init - | source

## pyenv
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# FZF key bindings and fuzzy completion:
fzf_key_bindings

# Special one-off for scmpuff
source $DOTFILES/**/fish/conf.d/scmpuff.fish


