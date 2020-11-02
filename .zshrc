#!/usr/bin/zsh

export KEYTIMEOUT=1
bindkey -v
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey '^q' push-line-or-edit

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_FUNCTIONS
setopt HIST_SAVE_NO_DUPS
setopt PUSHD_TO_HOME

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=bureau

DEFAULT_USER=$(whoami)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	docker
	pip
	pyenv
	ripgrep
	sudo
	tmux
	vscode
)

# These needs to come before `compinit` which happens in $ZSH/oh-my-zsh.sh
if [[ -d /home/linuxbrew/.linuxbrew/share/zsh/site-functions ]]; then
	fpath=(/home/linuxbrew/.linuxbrew/share/zsh/site-functions $fpath)
fi
if [[ -d "$HOME/.homesick/repos/homeshick/completions" ]]; then
	fpath=("$HOME/.homesick/repos/homeshick/completions" $fpath)
fi

if [[ -r "$HOME/.pam_environment" ]] && [[ -z $PAM_ENVIRONMENT_WAS_READ ]]; then
	export $(<"$HOME/.pam_environment")
fi

if [[ -r "$HOME/.profile" ]]; then
	source "$HOME/.profile"
fi

if [[ -r "$HOME/.zbash" ]]; then
	source "$HOME/.zbash"
fi

if [[ -r "$ZSH/oh-my-zsh.sh" ]]; then
	source "$ZSH/oh-my-zsh.sh"
else
	echo You might want to install https://github.com/robbyrussell/oh-my-zsh like
	echo '    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
fi

if [[ -r "$HOME/src/github/enhancd/init.sh" ]]; then
	source "$HOME/src/github/enhancd/init.sh"
fi

if command -v bat &>/dev/null; then
	export PAGER=bat
	export MANPAGER="sh -c 'col -bx | $PAGER -l man -p'"
fi

source "$HOME/.bash_aliases"

alias -g NUL="/dev/null"
alias -g DN=">/dev/null"
alias -g EN="2>/dev/null"
alias -g AN="&>/dev/null"
alias -g G="|rg"
alias -g IG="G -i"
alias -g L="|less"
alias -g GG="2>&1 |rg"
alias -g IGG="2>&1 -i"
alias -g LL="2>&1 |less"
