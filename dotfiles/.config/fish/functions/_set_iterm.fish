function _set_iterm
    _tmux_echo "\033]50;SetProfile=$argv\a"
    _dark_titlebar
end
