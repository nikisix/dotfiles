#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

if ! hash brew 2>/dev/null; then
    echo "Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

xcode-select --install
echo "Press enter once Xcode Command Line Tools are installed..."
read -r

echo "Installing brew packages"
xargs brew install      < ./requirements/brew-requirements.txt
echo "Installing brew cask apps"
xargs brew cask install < ./requirements/cask-requirements.txt

echo "Updating pip"
pip2 install --upgrade pip setuptools
pip3 install --upgrade pip setuptools
echo "Installing pip3 packages"
pip3 install -r ./requirements/pip3-requirements.txt

echo "Linking dotfiles to ~/"
# Using the gnu version of cp from brew coreutils b/c it has the -s flag for symbolic links and works with directories
gcp -srf "${PWD}"/dotfiles/.[^.]* ~/

echo "Installing Vundle"
test -d ~/.vim/bundle/Vundle.vim  || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Installing vim plugins..."
vim +PluginInstall +qall

echo "Installing TmuxPluginManager"
test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Start tmux and run 'prefix-I' to install tmux plugins... Press enter when done..."
read -r

echo "Changing default shell to brew's fish"
sudo sh -c "echo '/usr/local/bin/fish' >> /etc/shells"
chsh -s /usr/local/bin/fish

if hash gcloud 2>/dev/null; then
    echo 'y' | gcloud components install docker-credential-gcr
fi

./macos_settings.sh

echo "Done!"
