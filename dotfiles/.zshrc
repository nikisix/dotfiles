#bug fixes, can remove in the future
export ZSH_CACHE_DIR=~/.zsh_cache
export KONSOLE_VERSION=0
# export ZSH_THEME_GIT_PROMPT_AHEAD=true
# export ZSH_THEME_GIT_PROMPT_BEHIND="false"
# export ZSH_THEME_GIT_PROMPT_DIVERGED="false"
# export ZSH_THEME_GIT_PROMPT_STASHED="false"
export DISABLE_AUTO_TITLE='true'
export DISABLE_UPDATE_PROMPT="false"
export ZSH_DISABLE_COMPFIX="false"
# export INSIDE_EMACS="false" # warp needs this for some reason

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="random"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
ZSH_THEME_RANDOM_CANDIDATES=(
    "amuse" "arrow" "crunch" "daveverwer" "evan"
    "fishy" "fletcherm" "gallifrey" "kardan"
    "miloshadzic" "nebirhos" "peepcode"
) # "sunaku" "emotty" "lukerandall"
# Nice but broken themes
    # "zhann" - creates memory leak
    # "sunrise"
    # "wuffers"  - is now broken :/
#
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="false"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git colored-man-pages) # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/kubectl
plugins=(vi-mode fzf)
source <(fzf --zsh)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# eval "$(direnv hook zsh)"
#if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

# VIM mode
bindkey -v

# vim-mode
#
PROMPT="$PROMPT\$(vi_mode_prompt_info)"
# RPROMPT="\$(vi_mode_prompt_info)$RPROMPT"
VI_MODE_SET_CURSOR=true
MODE_INDICATOR="%F{white}+%f"
INSERT_MODE_INDICATOR="%F{yellow}+%f"
#
# works but too slow (recursive function max)
# function zle-line-init zle-keymap-select {
    # VIM_PROMPT="%{$fg_bold[green]%} [% NORMAL]%  %{$reset_color%}"
    # # RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git) $EPS1"
    # RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    # zle reset-prompt
# }

# zle -N zle-line-init
# zle -N zle-keymap-select
# source ~/.bin/tmuxinator.zsh
export KEYTIMEOUT=1

source $ZSH/oh-my-zsh.sh
source ~/.bashrc
# set -o vi
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

PATH="/Users/nickt/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/nickt/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/nickt/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/nickt/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/nickt/perl5"; export PERL_MM_OPT;

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# function precmd() { clear }
export POETRY_HTTP_BASIC_ARTIFACT_USERNAME=aws
export POETRY_HTTP_BASIC_ARTIFACT_PASSWORD=
export CODEARTIFACT_AUTH_TOKEN=
