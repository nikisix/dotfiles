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

source $ZSH/oh-my-zsh.sh

# Fix space being removed when using '|' characters
ZLE_REMOVE_SUFFIX_CHARS=""

# Customize to your needs...
export EDITOR='vim'
export GOPATH="$HOME"
export GOROOT="/usr/local/opt/go/libexec"
export RBENV_ROOT=/usr/local/var/rbenv

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew cp gem git github golang osx pip python rbenv ruby systemadmin vagrant zsh_reload)

go="$GOPATH/bin:$GOROOT/bin"
rbenv="$HOME/.rbenv/bin"
export PATH=$go:$rbenv:$PATH

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

bindkey -v
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey -a u undo
bindkey -a '^R' redo
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'g~' vi-oper-swap-case
bindkey -a G end-of-buffer-or-history

alias cask='brew cask'
alias g="git"
alias ll="ls -AGHohp"
alias tree="tree -a"

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Turn off special handling of ._* files in tar, etc.
export COPYFILE_DISABLE=1
