mkdir -p ~/.pyradio && ln -s ./dotfiles/.config/pyradio/stations.csv ~/.pyradio/stations.csv
mkdir ~/programs
git clone git@github.com:coderholic/pyradio.git
pipx install -e ~/programs/pyradio
pipx inject -r ~/programs/pyradio/requirements_pipx.txt pyradio
