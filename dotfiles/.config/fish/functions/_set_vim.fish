function _set_vim
    sed -i --follow-symlinks "s#set background=.*#set background=$argv#" ~/.config/nvim/init.vim
end
