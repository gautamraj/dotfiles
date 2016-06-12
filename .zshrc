# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
#DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git brew python mvn pip gnu-utils)
plugins=(git history-substring-search)

# User configuration
if [ -e ~/.zshrc_local ]; then
    . ~/.zshrc_local
fi

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# get all the boxen goodness
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# Python virtualenv
if [ -e ~/venv/bin/activate ]; then
    source ~/venv/bin/activate
fi

# Solarized dircolors
#if [ $TERM = "xterm-256color" ]; then
#  eval `dircolors .dircolors.ansi-dark`
#fi

source $ZSH/oh-my-zsh.sh

# Keep trailing slash on directory completion
setopt no_auto_remove_slash

# Fix github hub (aliased to git) completion
fpath=(~/.zsh/completions $fpath) 
autoload -Uz compinit && compinit

# ctrl-u
bindkey \^U backward-kill-line

# Common aliases
. ~/.aliases

# Golang!
export GOPATH="$HOME/source/golang"
export PATH=$PATH:$GOPATH/bin
