#!/usr/bin/env zsh

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install Homebrew and Prezto, initialize system settings
source homebrew

# Install Homebrew packages from the Brewfile
brew bundle

# Install languages
source ruby
source node
source python

# Start services
source services

# Install Prezto
source prezto

# Symlink the dotfiles
env RCRC=$SCRIPT_DIR/rcrc rcup

# Set up sane macOS defaults
source settings
