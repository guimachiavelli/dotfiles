# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
install bash
install bash-completion

# Install more recent versions of some OS X tools
install vim --override-system-vi
install homebrew/php/php55 --with-gmp

# Install other useful binaries
install ack
install git
install imagemagick --with-webp
install lynx
install nmap
install node # This installs `npm` too using the recommended installation method
install webkit2png

install homebrew/versions/lua52

# Remove outdated versions from the cellar
cleanup
