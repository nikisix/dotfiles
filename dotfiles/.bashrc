# set -o nounset
# set -o vi

if [[ `uname` == 'Darwin' ]]; then
    # kinesis keyboard remap non-us key (next to `/~ to left-alt)
    # https://developer.apple.com/library/archive/technotes/tn2450/_index.htmlhttps://developer.apple.com/library/archive/technotes/tn2450/_index.html
    hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x7000000E2}]}' > /dev/null
    if [[ $HOST=='sierranevada' ]]; then
        export PATH="/opt/homebrew/bin:$PATH" # homebrew
        export PATH="/Users/nickt/.local/bin:$PATH" # pipx
        export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH" # gnu-commands (ls, cp, ...etc)
        export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:$MANPATH" # gnu-command man-path

    elif [[ $HOST=='goldencoast' ]]; then
        export PATH="/Users/zen/bin:~/code/scripts:/usr/local/lib/ruby/gems/2.6.0/gems/tmuxinator-1.1.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
        # Add gnu coreutils to path
        export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
        # Add gnu coreutils docs
        export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    fi
    #for pylint
    LC_CTYPE=en_US.UTF-8
    export LC_CTYPE
elif [[ "$unamestr" == 'Linux' ]]; then
    echo 'penguin time!'
    source ~/.bash-windows  # TODO and uname == six
fi

#source ~/.git-prompt.sh #export PS1="\w\$(__git_ps1)=☆= "
#=✪=
#(♂)
export EDITOR=nvim
export HISTTIMEFORMAT='%F %T '
# TODO
export HOMEBREW_GITHUB_API_TOKEN=6cb508ae27ff3c3ae60f8e5e3855aa08e973d5ba
# export OPENAI_API_KEY=$(gpg --decrypt openai-api-key.asc)

#PYTHON
alias python=ptipython # TODO get the following line working and remove this
# export PYTHONSTARTUP=~/.pythonrc.py
# jupyter terminal
# alias jukit_kitty="kitty --listen-on=unix:/tmp/mykitty:"$(gdate +%s%N)" -o allow_remote_control=yes"
# Speed up program execution time maybe turn off
export PYTHONDONTWRITEBYTECODE=1

## Virtualenv Management
# create symlinks from ~/envs to repos' virtualenv folders to make sure this
# command can view all possible envs
export WORKON_HOME=~/envs
function activate() {
    if [[ -z $@ ]]; then
        echo $(ls $WORKON_HOME) $(ls | grep env)
    elif [[ $@ == 'env' ]]; then
        source ./env/bin/activate
    else
        source $WORKON_HOME/$1/bin/activate
    fi
}
export datadir=/Volumes/oasis/ntomasino/data/swlabs/model/

# PATHS
alias warehouse='cd /Users/six/code/unicorn/warehouse/src/warehouse/'
alias metrics='cd /Users/six/code/unicorn/warehouse/src/warehouse/bigquery/templates/metrics'
alias aa='cd ~/code/data_analytics_f20180410/'
alias unicorn='cd ~/code/unicorn'
alias upgrade_path='cd ~/code/data_analytics_f20180410/analytics/upgrade_path'
alias model='/Users/six/code/model/preprocessing/public_transit/chicago'
alias mmm='~/code/ror/mmm'
alias pylibs='/Users/nickt/code/ror/mmm/env/lib/python3.11/site-packages'

#SERVERS
alias emr='ssh -i ~/.ssh/dev-vpc-emr-yotabites.pem hadoop@172.23.11.97'

#some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -GF'
alias sl='ls -GF'
#print File Path
function fp() { for i in "$@"; do echo $(pwd)/"$i"; done; }
alias ag='ag --color'
alias pstree='pstree -g3 -s $1'
alias less='less -Sr'
# alias date='date --iso-8601'
alias gits='git status'
alias env-pipenv='source $(pipenv --venv)/bin/activate; [[ -f .env ]] && source .env'
alias debug='vi +UnstackFromClipboard'
# alias weather='ansiweather -l "kansas city, mo" -F -u imperial'
alias weather='ansiweather -l 4393217 -d -u imperial;ansiweather -l 4393217 -F -u imperial'
alias amorgosssh='ssh zen@192.168.1.109'
alias propdata='psql -h 192.168.1.109 -Upostgres -dpropdata'
alias warehousedb='psql -h localhost -Upostgres -dwarehouse'
alias redshift='psql -U aa_yotabites_dev -h dev-vpc-redshiftdev100.cqxlseythtmd.us-east-1.redshift.amazonaws.com -p 5439 -d yotabites'
alias lint='pylint --rcfile=~/code/data_analytics_f20180410/pylintrc'
alias matrix='cmatrix -sabu2'
function google () { w3m "http://www.google.com/search?q=$*"; }
alias news='newsbeuter'
alias sed='/opt/homebrew/bin/gsed'
alias sp='emacsclient -t $*'
alias spc='emacsclient -t $*'
alias vi='nvim'
alias viconfig='vi ~/.config/nvim/init.vim'
#function __csv { cat $1 | column -s, -t | less -S; }
function csv () { csvlook $1 | less -S; }
function csvsample () { head -n100 $1 | csvlook | less -S;}
alias clock='watch -n1 "date '+%D%n%T'|figlet -k"'
function difffiles () { diff <(sort $1) <(sort $2) | less -S; }
function cols () { head -n1 $1 | gsed 's/,/\n/g'; }
function cols1 () { python -c "import pandas as pd; df = pd.read_csv('$1', nrows=1); print(df.head(1).transpose());" }
function killps () { kill -9 `ps | grep $1 | sed 's/^[ ]*//' | cut -f1 -d ' '`; }
function gather () { sed -n -e "/$1/,/},/p" ~/code/dex/allcards.json; }
function mute () {   osascript -e 'set volume output muted true';
                    sleep 30;
                    osascript -e 'set volume output muted false';
                }

#function __cd {
    ##cd ${1/~/$HOME} #TODO not working b/c ~ doesn't get expanded
    ##pushd ${1:-$HOME} > /dev/null; #push new dir onto stack and cd to it
    #pushd ${PWD/~/$HOME} > /dev/null; #push new dir onto stack and cd to it
    #directory_stack=$(dirs -p | sort | uniq); #dedup and save
    #dirs -c; #clear stack
    #for dir in $directory_stack;do pushd -n $dir; done;# > /dev/null; done; #-n suppress dir change on push
    #dirs -v; #display
 #}
# function cd () { /usr/bin/cd $@; dirs -v; }
alias dv='dirs -v'

export PGPASSFILE=~/.pgpass

export PAGER="/usr/bin/less -Si" #dont wrap long lines. ignore case on searches
# alias ff='. ~/code/scripts/ff/ff.sh'
alias ff='. /Users/six/.ff/ff.sh'
# alias pianobar='pianobar 2>/dev/null'
alias pandora='pianobar'
alias bounce_pandora='killps pianobar;pianobar 2>/dev/null'
alias watchdir='watch -n1 -dc ls -alh'
alias docker-compost='docker-compose'
alias vimrc='vi ~/.config/nvim/init.vim'
alias bashrc='vi ~/.bashrc'
# alias env='source ~/.emacs.d/.python-environments/default/bin/activate'
alias psqllocal='psql -hlocalhost -Upostgres' #stay off of model's db-tunnel
#set up ssh tunnel. psql into db. kill tunnel on exit
alias sotdb="ssh -NL 6666:127.0.0.1:5432 -i ~/.ssh/google_compute_engine ntomasino@sot & sleep 1; psql -p6666 -Upostgres -hlocalhost -dmetadata; pkill -6 -f '6666:127.0.0.1:5432'"
alias floppy="ssh zen@192.168.4.32"
alias floppydb="psql -Upostgres -dpropdata -h 192.168.4.32"

# source ~/.bash_color
# alias dark="set_profile dark"
# alias light="set_profile light"

#source ~/.docker-composerc

function notify () {
    if eval "${@}"; then
        osascript -e "display notification \"Complete!\" with title \"${*}\""
    else
        osascript -e "display notification \"Failed! 😞\" with title \"${*}\""
    fi
}

#Kubernetes config
alias prod-kube='kubectl -n prod'

#Airflow
export AIRFLOW_HOME=~/airflow

#source ~/.alias_docker

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_TMUX_OPTS='-p80%,60%' # fzf opens up a sweet tmux pane
