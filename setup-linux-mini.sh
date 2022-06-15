#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# echo "Updating pip"
# pip3 install --upgrade pip setuptools
# echo "Installing python packages"
# pip3 install --upgrade -r ./requirements/python-requirements.txt
pip install tmuxp

echo "Linking dotfiles to ~/"
# Using the gnu version of cp from brew coreutils b/c it has the -s flag for symbolic links and works with directories
cp -srf "${PWD}"/linux-mini-dotfiles/.[^.]* ~/ #gcp is invoking git cherry-pick annoyingly

echo "Installing TmuxPluginManager"
test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Start tmux and run 'prefix-I' to install tmux plugins... Press enter when done..."
read -r

# echo "Changing default shell to brew's zsh"
# sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
# sudo chsh -s /usr/local/bin/zsh "$USER"
# echo "Installing oh-my-zsh"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# if hash gcloud 2>/dev/null; then
#     echo 'y' | gcloud components install docker-credential-gcr
# fi

echo 'installing jupyterlab vim'
pip install jupyterlab-vim
jupyter lab build --dev-build=False --minimize=False

echo "Done!"
