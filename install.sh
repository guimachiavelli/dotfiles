# rvm for the rubies
curl -L https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm

# homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install packages
sh brew.sh

# install applications
sh cask.sh

# osx defaults
sh .osx

# copy all dotfiles
rsync -av --progress ~/projects/dotfiles/ ./ --exclude install.sh --exclude .git --exclude .osx --exclude brew.sh --exclude cask.sh

# z
cd ~/code
git clone https://github.com/rupa/z.git
chmod +x ~/code/z/z.sh

# vundle
mkdir ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
