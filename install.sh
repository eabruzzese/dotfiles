#!/usr/bin/env zsh

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install Homebrew and Prezto, initialize system settings
pushd "./install"
	source homebrew
	source prezto
	source settings
popd

# Install Homebrew packages from the Brewfile
brew bundle

# Symlink the dotfiles
env RCRC=$SCRIPT_DIR/rcrc rcup