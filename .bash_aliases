#!/usr/bin/bash

if hash lsd >/dev/null 2>&1; then
	alias ls="lsd"
	alias l="ls -l --group-dirs=first"
	alias ll="ls -la --group-dirs=first"
	alias lt="ls --tree"
	alias ld="ls -lt --date=relative"
else
	alias l="ls -l --group-directories-first"
	alias ll="ls -la --group-directories-first"
	alias ld="ls -lt"
fi
alias la="ls -a"

if hash nvim >/dev/null 2>&1; then
	alias vim=nvim
    export EDITOR=nvim
elif hash vim >/dev/null 2>&1; then
	alias vim=vim
    export EDITOR=vim
elif hash joe >/dev/null 2>&1; then
	alias vim=joe
    export EDITOR=joe
elif hash nano >/dev/null 2>&1; then
	alias vim=nano
    export EDITOR=nano
fi

if hash fdfind >/dev/null 2>&1; then
	alias fd=fdfind
fi

alias enrun="LC_ALL=en_GB.utf8"
alias encalc="enrun libreoffice --calc"
alias dirs="dirs -v"
alias bd=". bd -si"
alias h=history
