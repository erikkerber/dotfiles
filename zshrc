# Path to dotfiles repo
export DOTFILES="$(dirname "$(readlink "$HOME/.zshrc")")"

export PATH="/opt/homebrew/bin:$PATH"

# Find all zsh files
configs=($DOTFILES/*/*.bash $DOTFILES/*/*.zsh)
for file in ${configs:#*/completions.zsh}
do
  source "$file"
done

# Load autocomplete and other zsh stuff
autoload -Uz compinit
compinit -i

for file in ${(M)configs:#*/completions.zsh}
do
  source "$file"
done

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
