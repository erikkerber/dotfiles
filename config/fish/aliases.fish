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
alias g="git"
alias gti="git"
alias push="git push"
alias gcm="g co master"
alias gcl="g co -"
alias grbm="g rebase master"
alias gap='g add .;g amendne; g punch'

# Flagship Git
alias gitnore="git update-index --skip-worktree"
alias gitmember="git update-index --no-skip-worktree"
alias mb="make bootstrap"

# Vim
alias v="nvim"
alias vv="nvim ."

alias chmox='chmod +x'

alias cask='brew cask'
alias brewu='brew update && brew upgrade && brew cleanup && brew doctor'

alias hosts='sudo $EDITOR /etc/hosts'

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
alias be='vim ~/.Brewfile'

# XcodeGen
alias xcg='mint run xcodegen'
alias rmdd='rm -fr ~/Library/Developer/Xcode/DerivedData'
alias resignxcode='sudo codesign -f -s XcodeSigner' # Pass Xcode path
alias provfiles='cd ~/Library/MobileDevice/Provisioning\ Profiles'
alias methoddump-'otool -ov'

# iOS Simulator
alias deeplink='xcrun simctl openurl booted'

# Docker
alias dockerkillall='docker kill (docker ps -q)'
alias dockerdac='docker rm (docker ps -a -q)'
alias dockerdai='docker rmi (docker images -q)'

# AG
alias ag='ag --follow --hidden --ignore .git --ignore derivedData --ignore Carthage'

# Homebrew upgrade/date is confusing
alias brew_update="brew -v update; brew upgrade --force-bottle --cleanup; brew cleanup; brew cask cleanup; brew prune; brew doctor"

# JSON Pretty Print
alias jpp='pbpaste | jsonpp | less'

# Simctl
alias xcdevices='xcrun simctl list devices'
alias xcbuildsim="xcodebuild -workspace Harmony.xcworkspace -scheme Harmony -destination 'platform=iOS Simulator,name=iPhone 5s' -derivedDataPath './derivedData' build"
alias killsim='killall "com.apple.CoreSimulator.CoreSimulatorService" && killall "Simulator"'

# Marked
alias marked='open -a Marked\ 2'

# macOS
alias makespacer='defaults write com.apple.dock persistent-apps -array-add \'{"tile-type"="spacer-tile";}\'; killall Dock'
