# Enable aliases to be sudo'ed
abbr sudo "sudo "

# Fish
abbr reload 'source ~/.config/fish/config.fish'

# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

function grep     ; command grep --color auto $argv ; end

if type -q exa
  abbr ls "exa"
end

# Git
if type -q git
  abbr g 'git'
  abbr gti 'git'
  abbr push 'git push'
  abbr gcm 'g co main'
  abbr gcl 'g co -'
  abbr grbm 'g rebase main'
  abbr gap 'g add .;g amendne; g punch'
  abbr ga 'g headpr' # git-pile helper
  abbr ghs 'g headpr --squash' # git-pile helper
  abbr ggone 'g branch -v | grep '\[gone\]' | awk '{ print \$1 }''
  abbr glo 'g lo'
  abbr gd 'git diff'
  abbr gdc 'git diff --cached -w'
  abbr gds 'git diff --staged -w'
  abbr gsh 'git show'
  abbr gl 'git l'
end

# Bazel
if type -q bazel
  abbr b 'bazel'
  abbr br 'bazel run'
  abbr bt 'bazel test'
  abbr bb 'bazel build'
  abbr bi 'bazel info'
  abbr bbl 'bazel info bazel-bin'
end

# Vim
if type -q nvim
  abbr v 'nvim'
  abbr vv 'nvim .'
end

# Brew
if type -q brew
  abbr cask 'brew install --cask'
  abbr brewu 'brew update && brew upgrade && brew cleanup && brew doctor'
  abbr ibrew 'arch -x86_64 /usr/local/bin/brew'
  # Homebrew upgrade/date is confusing
  abbr brew_update 'brew -v update; brew upgrade --force-bottle --cleanup; brew cleanup; brew cask cleanup; brew prune; brew doctor'
end

# Networking. IP address, dig, DNS
if type -q dig
  abbr ip "dig +short myip.opendns.com @resolver1.opendns.com"
  abbr dig "dig +nocmd any +multiline +noall +answer"
end

# Better formatted diskspace
if type -q df
  abbr diskspace "df -P -kHl"
end

# Archives
if type -q tar
  abbr mktar 'tar -pvczf'
  abbr untar 'tar -zxvf'
end

# Config quick Edits
if type -q chezmoi
  abbr fe 'chezmoi edit ~/.config/fish/config.fish'
  abbr ae 'chezmoi edit ~/.config/fish/aliases.fish'
  abbr ve 'chezmoi edit ~/.vimrc'
  abbr ge 'chezmoi edit ~/.gitconfig'
  abbr be 'v ~/.local/share/chezmoi/Brewfile'
  abbr bce 'v ~/.local/share/chezmoi/Brewfile.mac'
  abbr bre 'chezmoi ~/.bazelrc'
  abbr pe 'chezmoi edit ~/.vim/plugs.vim'
  abbr te 'chezmoi edit ~/.tmux.conf'
  abbr ace 'chezmoi edit ~/.config/alacritty/alacritty.yml'
end

# Xcode
if type -q xcrun
  abbr xc-cleansims 'xcrun simctl delete unavailable'
  abbr xc-resignxcode 'sudo codesign -f -s XcodeSigner' # Pass Xcode path
  abbr xc-provfiles 'cd ~/Library/MobileDevice/Provisioning\ Profiles'
  abbr xc-dd 'cd ~/Library/Developer/Xcode/DerivedData'
  abbr xc-rmdd 'rm -fr ~/Library/Developer/Xcode/DerivedData'
  abbr xc-buildnum 'xcodebuild -version | tail -1 | cut -d " " -f3'
  # iOS Simulator
  abbr xc-deeplink 'xcrun simctl openurl booted'
  abbr xc-devices 'xcrun simctl list devices'
  abbr xc-killsim 'killall "com.apple.CoreSimulator.CoreSimulatorService" && killall "Simulator"'
end

# Static Analysis
if type -q xcrun
  abbr otool-methods 'otool -ov'
end

# Docker
if type -q docker
  abbr dockerkillall 'docker kill (docker ps -q)'
  abbr dockerdac 'docker rm (docker ps -a -q)'
  abbr dockerdai 'docker rmi (docker images -q)'
end

# ag
if type -q ag
  abbr brew 'ag --follow --hidden --ignore .git'
end

# JSON Pretty Print
if type -q json_pp
  abbr jpp 'pbpaste | json_pp | bat'
end

# macOS
abbr daemonblame 'launchctl list | grep -v com.apple'

