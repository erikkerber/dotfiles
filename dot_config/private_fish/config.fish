# Uncomment this if the modal indicator becomes annoying
function fish_mode_prompt; end

# Path to dotfiles repo
#:wqset -x DOTFILES (dirname "$HOME/dotfiles")

# Set PATH using fish_user_paths for user-specific directories
set -Ua fish_user_paths $HOME/.cargo/bin
set -Ua fish_user_paths $HOME/.rbenv/bin
set -Ua fish_user_paths $HOME/.local/bin
set -Ua fish_user_paths $HOME/go/bin
set -Ua fish_user_paths /opt/homebrew/bin
set -Ua fish_user_paths $HOME/Developer/slack/slack-objc/bin

# OpenJDK
fish_add_path /opt/homebrew/opt/openjdk/bin
set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk/include"

# GPG
set -gx GPG_TTY (tty)

# FZF Configuration
set -gx FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*" --ansi'
set -gx FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude .git'
set -Ux FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# git-pile
set -gx GIT_PILE_PREFIX ek/
set -gx GIT_PILE_USE_PR_TEMPLATE 1

# Editor
set -gx EDITOR nvim

# Source all fish files except config.fish
for file in $HOME/.config/**/fish/*.fish
  switch $file
  case "*config.fish"
    # Don't source the config itself
  case '*'
    source $file
  end
end

# rbenv
rbenv init - | source

# pyenv
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# scmpuff
scmpuff init --shell=fish | source

# zoxide
zoxide init fish | source

