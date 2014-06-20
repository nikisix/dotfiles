# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"
ZSH_THEME="lambda_custom"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew cabal cp gem git github golang osx pip python ruby rvm systemadmin vagrant zsh_reload)

source $ZSH/oh-my-zsh.sh

# Fix space being removed when using '|' characters
ZLE_REMOVE_SUFFIX_CHARS=""

# Customize to your needs...
cabal="$HOME/.cabal/bin"
go="$GOPATH/bin:/usr/local/go/bin:"
homebrew="/usr/local/bin"
rvm="$HOME/.rvm/bin"
export PATH=$cabal:$go:$rvm:$homebrew:$PATH
export GOROOT=`go env GOROOT`
export GOPATH="$HOME/go"

bindkey "^?" backward-delete-char

bindkey "\033[H" beginning-of-line
bindkey "\033[F" end-of-line
bindkey -M vicmd "\033[H" vi-beginning-of-line
bindkey -M vicmd "\033[F" vi-end-of-line

set -o vi

alias ll="ls -AGohp"
alias tree="tree -a"

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias ed='ed -pλ:'

function hyrule {
  source ~/.openstackrc/hyrule.sh
}
