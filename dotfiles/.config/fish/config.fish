set -x COPYFILE_DISABLE 1 # Turn off special handling of ._* files in tar, etc.
set -x EDITOR 'vim'
set -x GOPATH $HOME
set -x PAGER "/usr/bin/less -S" # Don't wrap when paging, in eg: psql
set PATH $GOPATH/bin $PATH

fish_vi_key_bindings

eval (hub alias -s)
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
if test -e config.override.fish
    source config.override.fish
end
