set -o vi

# printf '%b' '\e]12;red\a'

if [ -f "/google/devshell/bashrc.google" ]; then
  gcloud config set project email-dm-optimization
  # sudo apt-get install neovim
  # source "/google/devshell/bashrc.google"
fi
#source ~/.git-prompt.sh #export PS1="\w\$(__git_ps1)=☆= "
#=✪=
#(♂)
export EDITOR=vi
export HISTTIMEFORMAT='%F %T '
# TODO
# export HOMEBREW_GITHUB_API_TOKEN=6cb508ae27ff3c3ae60f8e5e3855aa08e973d5ba

# export IPYTHONPATH=$PYTHONPATH
alias ipython="python -m IPython"
# Instruct Python to execute a start up script
# export PYTHONSTARTUP=$HOME/.python_startup.py
# Speed up program execution time maybe turn off
export PYTHONDONTWRITEBYTECODE=1

#some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -GF'
alias sl='ls -GF'
function fp() { for i in "$@"; do echo $(pwd)/"$i"; done; }
alias ag='ag --color'
alias pstree='pstree -g3 -s $1'
alias less='less -Sir'
# alias date='date --iso-8601' 2>/dev/null
alias gits='git status'
alias debug='vim +UnstackFromClipboard'
# alias vi=$(which nvim)

alias matrix='cmatrix -sabu2'
function google () { w3m "http://www.google.com/search?q=$*"; }

alias viconfig='vi ~/.config/nvim/init.vim'
alias clock='watch -n1 "date '+%D%n%T'|figlet -k"'
function difffiles () { diff <(sort $1) <(sort $2) | less -S; }
function cols () { head -n1 $1 | sed 's/,/\n/g'; }
function killps () { kill -9 `ps | grep $1 | sed 's/^[ ]*//' | cut -f1 -d ' '`; }

alias dv='dirs -v'

export PAGER="/usr/bin/less -Si" #dont wrap long lines. ignore case on searches
