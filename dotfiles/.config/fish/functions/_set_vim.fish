function _set_vim
    sed -i --follow-symlinks "s#set background=.*#set background=$argv#" ~/.vimrc
    # Temp: this is to test out my sigusr1 vim branch to auto reload
    pgrep -f './vim sigusr1' | xargs -r kill -s SIGUSR1
end
