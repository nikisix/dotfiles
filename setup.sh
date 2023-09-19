#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

if ! hash brew 2>/dev/null; then
    echo "Installing homebrew"
    #/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install)"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/$(USERNAME)/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Installing brew and cask packages"
brew bundle --file=requirements/Brewfile

echo "Updating pip"
pip3 install --upgrade pip setuptools
echo "Installing python packages"
pip3 install --upgrade -r ./requirements/python-requirements.txt


echo "Linking dotfiles to ~/"
# Using the gnu version of cp from brew coreutils b/c it has the -s flag for symbolic links and works with directories
cp -srf "${PWD}"/dotfiles/.[^.]* ~/ #gcp is invoking git cherry-pick annoyingly

echo "Installing TmuxPluginManager"
test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Start tmux and run 'prefix-I' to install tmux plugins... Press enter when done..."
read -r

echo "Changing default shell to brew's zsh"
sudo sh -c "echo '/opt/homebrew/bin/zsh' >> /etc/shells"
chsh -s /opt/homebrew/bin/zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if hash gcloud 2>/dev/null; then
    echo 'y' | gcloud components install docker-credential-gcr
fi

./macos_settings.sh

echo "Done!"
