#!/usr/bin/env zsh

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install Homebrew and Prezto, initialize system settings
pushd "./install"
    source homebrew
    source prezto
popd

# Install Homebrew packages from the Brewfile
brew bundle

pushd "./install"
    source settings
    source languages/ruby
popd

# Symlink the dotfiles
env RCRC=$SCRIPT_DIR/rcrc rcup
