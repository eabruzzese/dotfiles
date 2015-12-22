#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Use vim as the default editor
export EDITOR="vim"

# rbenv
eval "$(rbenv init - --no-rehash zsh)"

# Aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local bin
export PATH="${ZDOTDIR:-$HOME}/dotfiles/bin:$PATH"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
