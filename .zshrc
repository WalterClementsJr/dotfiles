export ZSH="$HOME/.oh-my-zsh"
plugins=(z)
source $ZSH/oh-my-zsh.sh

source ~/.zsh_theme

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

