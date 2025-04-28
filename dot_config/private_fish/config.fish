# Uncomment this if the modal indicator becomes annoying
function fish_mode_prompt; end

# Path to dotfiles repo
#:wqset -x DOTFILES (dirname "$HOME/dotfiles")

# set -x JAVA_HOME $HOME/Library/Java/JavaVirtualMachines/openjdk-21.0.2/Contents/Home

# .config setting (for several apps including lazygit)
set -q XDG_CONFIG_HOME; or set -g XDG_CONFIG_HOME "$HOME/.config"

# OpenJDK
fish_add_path /opt/homebrew/opt/openjdk/bin
set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk/include"

# GPG
set -gx GPG_TTY (tty)

# bat
set -gx BAT_THEME Dracula

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

# direnv
direnv hook fish | source

# Slack PDE
/usr/bin/ssh-add --apple-load-keychain >/dev/null 2>&1

# For fish subshells, add to ~/.config/fish/config.fish.
# if status is-interactive
#   printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish"}}\x9c'
# end
