# rvm for the rubiess
curl -L https://get.rvm.io | bash -s stable --ruby

# homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install packages
brew bundle Brewfile

# install applications
brew bundle Caskfile

# osx defaults
sh .osx

# copy all dotfiles
rsync -av --progress ~/projects/dotfiles/ ./ --exclude install.sh --exclude
Brewfile --exclude Caskfile --exclude .git --exclude .osx

# z
cd ~/code
git clone https://github.com/rupa/z.git
chmod +x ~/code/z/z.sh

# vundle
mkdir ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
