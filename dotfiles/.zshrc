# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="lambda_custom"
COMPLETION_WAITING_DOTS="true"
ZLE_REMOVE_SUFFIX_CHARS="" # Fix space being removed when using '|' characters

# Mostly used for autocompletion.
plugins=(
  brew
  docker
  docker-compose
  golang
)

source $ZSH/oh-my-zsh.sh

export COPYFILE_DISABLE=1 # Turn off special handling of ._* files in tar, etc.
export PAGER="/usr/bin/less -S" # Don't wrap when paging, in eg: psql
export EDITOR='vim'
export GOPATH="$HOME"

gobins="$GOPATH/bin"
export PATH=$gobins:$PATH

eval "$(hub alias -s)"
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

set -o vi
bindkey '^?' backward-delete-char # Same, but I think works for os x.
bindkey '^H' backward-delete-char # Delete characters after entering append/insert mode
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a G end-of-buffer-or-history
bindkey -a u undo # Undo more than one change
bindkey -a '^R' redo

alias cp='cp -i'
alias g="git"
alias ll="ls -AGHohp"
alias mv='mv -i'
alias rm='rm -i'
alias tree="tree -a"

if [[ -f ~/.zshrc.override ]]
then
    source ~/.zshrc.override
fi

# Set dark title bar and automatically use tmux - set in iTerm's command. Echo special escape codes to change color.
# Creates new and attaches to session, or attaches to existing in a new session (allows using different tmux windows in
# different terminals). When creating new that attaches to base, deletes extra session.
#
# echo -e "\033]6;1;bg;red;brightness;0\a" && echo -e "\033]6;1;bg;green;brightness;0\a" && echo -e "\033]6;1;bg;blue;brightness;0\a" && tmux new -s base || tmux new -t base | awk '{ gsub("\\)]", "", $4); print $4 }' | xargs tmux kill-session -t
