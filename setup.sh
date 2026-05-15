#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

if ! hash brew 2>/dev/null; then
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/$(USERNAME)/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Installing brew and cask packages"
brew bundle --file=requirements/Brewfile

echo "Installing python packages"
for pkg in $(grep -v '^#' requirements/python-requirements.txt | grep -v '^$'); do
    echo "Installing $pkg...";
    pipx install $pkg;
done
pipx ensurepath
source ~/.zshrc

echo "Linking dotfiles to ~/"
# Using the gnu version of cp from brew coreutils (in gnubin) b/c it has the -s flag for symbolic links and works with directories
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
cp -srf "${PWD}"/dotfiles/.[^.]* ~/ # SOURCE must resolve to an absolute path to work
# ln -s "${PWD}"/dotfiles/.[^.]* ~/

echo "Installing TmuxPluginManager"
test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Start tmux and run 'prefix-I' to install tmux plugins... Press enter when done..."
read -r

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# if hash gcloud 2>/dev/null; then
#     echo 'y' | gcloud components install docker-credential-gcr
# fi

# install lunarvim
# bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
./macos_settings.sh

echo "Done!"
