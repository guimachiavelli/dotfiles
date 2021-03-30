#!/bin/sh

# Tap improved emacs repo
brew tap d12frosted/emacs-plus

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
brew install youtube-dl
brew install aspell
brew install ansible
brew install composer

# Install native apps
brew install dropbox
brew install google-chrome
brew install firefox
brew install the-unarchiver
brew install transmission
brew install calibre
brew install virtualbox
brew install vagrant
brew install vlc
brew install onepassword
brew install qlmarkdown
brew install qlstephen
brew install quicklook-json

brew install sketch
brew install zotero
brew install universal-media-server

brew install emacs-plus  --with-natural-title-bars

brew cleanup
