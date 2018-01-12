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
export EDITOR='vim'
export GOPATH="$HOME"
export PAGER="/usr/bin/less -S" # Don't wrap when paging, in eg: psql

gobins="$GOPATH/bin"
export PATH=$gobins:$PATH

eval "$(hub alias -s)"
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

set -o vi
bindkey '^?' backward-delete-char # Same as below, but I think works for os x.
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
# Disables changing directory w/o `cd`
unsetopt AUTO_CD

# Move these to a backup bin folder that is last in PATH
gsutil () {
  if hash gsutil 2>/dev/null; then
    command gsutil "${@}"
  else
    docker pull google/cloud-sdk > /dev/null
    docker run -it -v /root/.config:/root/.config -v "${PWD}":/output --net=host --rm google/cloud-sdk gsutil "${@}"
  fi
}

etcdctl () {
  docker run --rm -i quay.io/coreos/etcd etcdctl "${@}"
}

make() {
  (
    while [ "${PWD}" != '/' ] && [ ! -e 'Makefile' ]; do
      cd ..
    done
    command make "${@}" # Run make even without a Makefile to allow `make --help`, etc
  )
}

set_iterm() {
  profile="${1}"

  iterm_cmd="\033]50;SetProfile=${profile}\a"
  if [[ -n "${TMUX}" ]]; then
    echo -e "\033Ptmux;\033${iterm_cmd}\033\\"
  else
    echo -e "${iterm_cmd}"
  fi
}

set_vim() {
  profile="${1}"

  gsed -i "s#set background=.*#set background=${profile}#" ~/.vimrc
  # Temp: this is to test out my sigusr1 vim branch to auto reload
  pgrep -f './vim sigusr1' | xargs -r kill -s SIGUSR1
}

set_tmux() {
  profile="${1}"

  gsed -i "s#set -g @colors-solarized '.*'#set -g @colors-solarized '${profile}'#" ~/.tmux.conf
  tmux source-file ~/.tmux.conf
}

set_profile() {
  profile="${1}"

  set_iterm "${profile}"
  set_tmux "${profile}"
  set_vim "${profile}"
}

alias dark="set_profile dark"
alias light="set_profile light"

set_gcloud() {
  export CLOUDSDK_CORE_ACCOUNT="${1}"
  export CLOUDSDK_CORE_PROJECT="${2}"
}

notify() {
    if eval "${@}"; then
        osascript -e "display notification \"Complete!\" with title \"${*}\""
    else
        osascript -e "display notification \"Failed! 😞\" with title \"${*}\""
    fi
}

_iterm2_hook() {
  # This function should be used as the iterm2 command to run on terminal open
  #
  # Set iterm title bar to black
  echo -e "\033]6;1;bg;red;brightness;0\a"
  echo -e "\033]6;1;bg;green;brightness;0\a"
  echo -e "\033]6;1;bg;blue;brightness;0\a"
  # Create a new tmux session if it doesn't exists. Otherwise, create a new grouped session and clean it up on exit.
  # This allows multiple terminals to view different tmux windows.
  tmux new -s base || \
    tmux new -t base \
    | awk '{ gsub("\\)]", "", $4); print $4 }' \
    | xargs --no-run-if-empty tmux kill-session -t
}

if [[ -f ~/.zshrc.override ]]
then
    source ~/.zshrc.override
fi
