# rvm for the rubies
curl -L https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm

# homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install packages
sh brew.sh

# set latest bash as default
sh bash.sh

# osx defaults
sh .osx

# copy all dotfiles
rsync -av --progress ./ ~/ --exclude install.sh --exclude .git --exclude .osx --exclude brew.sh --exclude cask.sh --exclude npm.sh
