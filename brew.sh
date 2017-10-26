#!/bin/sh

# tap dupes for make
brew tap homebrew/dupes

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
brew install bash
brew install bash-completion

# Install more recent versions of some OS X tools
brew install coreutils
brew install vim --override-system-vi
brew install make --with-default-names
brew install findutils --with-default-names

# Install other useful binaries
brew install ack
brew install git
brew install imagemagick --with-webp
brew install node
brew install ffmpeg
brew install editorconfig
brew install youtube-dl
brew install tmux

# tap  Homebrew games
brew tap Homebrew/homebrew-games

# games =)
# brew install dwarf-fortress
# brew install stone-soup
# brew install robotfindskitten

# Remove outdated versions from the cellar
brew cleanup
