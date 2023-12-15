# Enable aliases to be sudo'ed
alias sudo="sudo "

# Fish
alias reload='source ~/.config/fish/config.fish'

# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

function g        ; git $argv ; end
function grep     ; command grep --color=auto $argv ; end

alias ls="exa"

# Git
alias g="git"
alias gti="git"
alias push="git push"
alias gcm="g co main"
alias gcl="g co -"
alias grbm="g rebase main"
alias gap='g add .;g amendne; g punch'
alias ga='g headpr' # git-pile helper
alias ghs='g headpr --squash' # git-pile helper
alias ggone="g branch -v | grep '\[gone\]' | awk '{ print \$1 }'"
alias glo="g lo"

# Bazel
alias b="bazel"
alias br="bazel run"
#alias bb="bazel build"
alias bt="bazel test"

# Vim
alias v="nvim"
alias vv="nvim ."

alias chmox='chmod +x'

# Brew
alias cask='brew cask'
alias brewu='brew update && brew upgrade && brew cleanup && brew doctor'
alias ibrew='arch -x86_64 /usr/local/bin/brew'
# Homebrew upgrade/date is confusing
alias brew_update="brew -v update; brew upgrade --force-bottle --cleanup; brew cleanup; brew cask cleanup; brew prune; brew doctor"

# *nix
alias hosts='sudo $EDITOR /etc/hosts'
alias fs="stat -f \"%z bytes\""
alias tryst='cd (mktemp -d)'

# Rosetta
alias i="arch -x86_64"

# Networking. IP address, dig, DNS
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias dig="dig +nocmd any +multiline +noall +answer"

alias diskspace_report="df -P -kHl"
alias free_diskspace_report="diskspace_report"

# macOS

# TODO / (ultralist)
alias td='ultralist'
alias tdc='ultralist complete'
alias tda='ultralist add'
alias tdd='ultralist list group:contexts'
alias tddn='tdd context:Now'
alias tdn='ultralist list group:contexts --notes'
alias tdl='tdd'

# Thermal throttling monitor
alias thermlog="pmset -g thermlog"

# Archives
alias mktar="tar -pvczf"
alias untar="tar -zxvf"

# Remove all items from the dock
alias cleardock="defaults write com.apple.dock persistent-apps -array \"\" && killall Dock"

# Git
alias gd='git diff'
alias gdc='git diff --cached -w'
alias gds='git diff --staged -w'
alias gsh='git show'
alias gl='git l'

# Quick Edits
alias fe='v ~/.config/fish/config.fish'
alias ae='v ~/.config/fish/aliases.fish'
alias ve='v ~/.vimrc'
alias ge='v ~/.gitconfig'
alias be='v ~/.Brewfile'
alias bce='v ~/.Brewfile.mac'
alias bre='v ~/.bazelrc'
alias pe='v ~/.vim/plugs.vim'
alias te='v ~/.tmux.conf'
alias ace='v ~/.config/alacritty/alacritty.yml'

# Xcode
alias xc-cleansims='xcrun simctl delete unavailable'
alias xc-resignxcode='sudo codesign -f -s XcodeSigner' # Pass Xcode path
alias xc-provfiles='cd ~/Library/MobileDevice/Provisioning\ Profiles'
alias xc-dd='cd ~/Library/Developer/Xcode/DerivedData'
alias xc-rmdd='rm -fr ~/Library/Developer/Xcode/DerivedData'
alias xc-buildnum='xcodebuild -version | tail -1 | cut -d " " -f3'

# Static Analysis
alias methoddump='otool -ov'

# iOS Simulator
alias deeplink='xcrun simctl openurl booted'

# Bazel
alias bazelbinloc='bazel info bazel-bin'
alias bi='bazel info'

# Docker
alias dockerkillall='docker kill (docker ps -q)'
alias dockerdac='docker rm (docker ps -a -q)'
alias dockerdai='docker rmi (docker images -q)'

# AG
alias ag='ag --follow --hidden --ignore .git --ignore derivedData --ignore Carthage'

# JSON Pretty Print
alias jpp='pbpaste | json_pp | bat'

# Simctl
alias xcdevices='xcrun simctl list devices'
alias killsim='killall "com.apple.CoreSimulator.CoreSimulatorService" && killall "Simulator"'

# macOS
alias makespacer='defaults write com.apple.dock persistent-apps -array-add \'{"tile-type"="spacer-tile";}\'; killall Dock'
alias daemonblame='launchctl list | grep -v com.apple'
alias kextblame='kextstat -l | grep -v com.apple'

# Secrets

## Fish-friendly signin to 1Password. Sets OP_SESSION_my env var
alias ops='set -x OP_SESSION_my (op signin|sed -n \'s/.*OP_SESSION_my=//p\'|tr -d \'"\')'

## After login above, source my secrets file
alias opsource='op get document 7dgga4l2zndutiafauklhwfweq | source'

# Reminders
alias rs='reminders add Slack'