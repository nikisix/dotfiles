set -o errexit

echo "Installing homebrew"
brew -h || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing brew packages"
xargs brew install      < ./requirements/brew-requirements.txt
echo "Installing brew cask apps"
xargs brew cask install < ./requirements/cask-requirements.txt
echo "Installing from commands"
sh ./requirements/manual-requirements.sh

echo "Setting up nvm"
mkdir -p ~/.nvm # Setup nvm's working directory
export NVM_DIR=~/.nvm
set +o errexit # Something in there fails, but is ok.
source $(brew --prefix nvm)/nvm.sh
set -o errexit

echo "Installing latest node"
nvm install node

echo "Updating pip"
pip install --upgrade pip setuptools
pip3 install --upgrade pip setuptools
echo "Installing pip packages"
pip install -r ./requirements/pip-requirements.txt

echo "Creating docker machine"
docker-machine status default || docker-machine create -d virtualbox --virtualbox-memory "4096" --virtualbox-disk-size "102400" default # 4GB RAM, 100GB storage

echo "Installing Vundle"
test -d ~/.vim/bundle/Vundle.vim  || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Installing vim plugins..."
vim +PluginInstall +qall

echo "Installing TmuxPluginManager"
test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Start tmux and run 'prefix-I' to install tmux plugins... Press enter when done..."
read

echo "Changing default shell to brew's zsh"
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s /usr/local/bin/zsh

echo "Linking dotfiles to ~/"
# Using the gnu version of cp from brew coreutils b/c it has the -s flag for symbolic links and works with directories
gcp -srf ~/Documents/JacobHayes/dotfiles/dotfiles/.* ~/

echo "Allowing repeated keypresses"
defaults write -g ApplePressAndHoldEnabled -bool true

echo "Done!"
