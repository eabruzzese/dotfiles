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

# Always install Casks to /Applications by default
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Add Homebrew to the PATH
export PATH="$(brew --prefix)/bin:$PATH"

# Ruby
eval "$(rbenv init - --no-rehash zsh)"

# Node
export NVM_DIR="${ZDOTDIR:-$HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Require all pip installations to require a virtualenv
export PIP_REQUIRE_VIRTUALENV=true

# Set virtualenv directories
export WORKON_HOME="$HOME/Workspace"
export PROJECT_HOME=$WORKON_HOME

# Aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local bin
export PATH="${ZDOTDIR:-$HOME}/dotfiles/bin:$PATH"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
