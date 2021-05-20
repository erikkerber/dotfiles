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
alias gcm="g co main"
alias gcl="g co -"
alias grbm="g rebase master"
alias gap='g add .;g amendne; g punch'
alias ggone="g branch -v | grep '\[gone\]' | awk '{ print \$1 }'"

# Flagship Git
alias mb="make bootstrap"

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
alias fe='vim ~/.config/fish/config.fish'
alias ae='vim ~/.config/fish/aliases.fish'
alias ve='vim ~/.vimrc'
alias ge='vim ~/.gitconfig'
alias be='vim ~/.Brewfile'

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
alias bb='cd /private/var/tmp/_bazel_erik/'
alias bi='bazel info'

# Docker
alias dockerkillall='docker kill (docker ps -q)'
alias dockerdac='docker rm (docker ps -a -q)'
alias dockerdai='docker rmi (docker images -q)'

# AG
alias ag='ag --follow --hidden --ignore .git --ignore derivedData --ignore Carthage'

# JSON Pretty Print
alias jpp='pbpaste | jsonpp | less'

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

# Build Farm
alias bf1='ssh svbuildmobile@10.101.131.71'
alias bf2='ssh svbuildmobile@10.101.131.72'
alias bf3='ssh svbuildmobile@10.101.131.73'
alias bf4='ssh svbuildmobile@10.101.131.74'
alias bf5='ssh svbuildmobile@10.101.131.75'
alias bf6='ssh svbuildmobile@edge-ios-build-06.target.com'
alias bf7='ssh svbuildmobile@edge-ios-build-07.target.com'
alias bfturtle='ssh svbuildmobile@10.101.131.27'
alias trashcan='ssh massroot@10.108.110.74'
alias uitest1='ssh svbuildmobile@10.101.131.24'
alias uitest2='ssh svbuildmobile@10.101.131.25'
