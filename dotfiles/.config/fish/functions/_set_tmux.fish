function _set_tmux
    sed -i --follow-symlinks "s#set -g @colors-solarized '.*'#set -g @colors-solarized '$argv'#" ~/.tmux.conf
    tmux source-file ~/.tmux.conf
end
