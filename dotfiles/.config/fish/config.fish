set -x COPYFILE_DISABLE 1 # Turn off special handling of ._* files in tar, etc.
set -x EDITOR 'nvim' # The vim function only works with fish
set -x GOPATH $HOME
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x PAGER "/usr/bin/less -S" # Don't wrap when paging, in eg: psql
set PATH $GOPATH/bin $PATH
set fish_greeting ""

fish_vi_key_bindings

eval (hub alias -s)
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
if test -e ~/.config/fish/config.override.fish
    source ~/.config/fish/config.override.fish
end
