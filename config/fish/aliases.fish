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

# Git
alias push="git push"
alias g="git"

# Vim
alias v="vim"
alias vv="vim ."

alias chmox='chmod +x'

alias cask='brew cask'
alias brewu='brew update && brew upgrade && brew cleanup && brew doctor'

alias hosts='sudo $EDITOR /etc/hosts'

alias ag='ag --follow --hidden'

alias fs="stat -f \"%z bytes\""

# Networking. IP address, dig, DNS
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias dig="dig +nocmd any +multiline +noall +answer"

alias diskspace_report="df -P -kHl"
alias free_diskspace_report="diskspace_report"

# Archives
alias mktar="tar -pvczf"
alias untar="tar -zxvf"

# Remove all items from the dock
alias cleardock="defaults write com.apple.dock persistent-apps -array \"\" && killall Dock"

# Git
alias gd='git diff'
alias gdc='git diff --cached -w'
alias gds='git diff --staged -w'
alias gs='git status'
alias gsh='git show'
alias gl='git l'

# Rome
alias romesync='romedown && bootstrap && romeup'
alias bootstrap='carthage bootstrap --platform iOS --no-use-binaries --cache-builds --new-resolver'
alias romedown='rome download --platform iOS'
alias romeup='rome list --missing --platform iOS | awk \'{print $1}\' | xargs rome upload --platform iOS'

# Quick Edits
alias fe='vim ~/.config/fish/config.fish'
alias ae='vim ~/.config/fish/aliases.fish'
alias ve='vim ~/.vimrc'
alias ge='vim ~/.gitconfig'

# XcodeGen
alias xcg='mint run xcodegen'
alias rmdd='rm -fr ~/Library/Developer/Xcode/DerivedData'

# iOS Simulator
alias deeplink='xcrun simctl openurl booted'

# Docker
alias dockerkillall='docker kill (docker ps -q)'
alias dockerdac='docker rm (docker ps -a -q)'
alias dockerdai='docker rmi (docker images -q)'
