#!/usr/bin/bash

if command -v lsd &>/dev/null; then
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

if command -v nvim &>/dev/null; then
	alias vim=nvim
    export EDITOR=nvim
elif command -v vim &>/dev/null; then
	alias vim=vim
    export EDITOR=vim
elif command -v joe &>/dev/null; then
	alias vim=joe
    export EDITOR=joe
elif command -v nano &>/dev/null; then
	alias vim=nano
    export EDITOR=nano
fi

if command -v fdfind &>/dev/null; then
	alias fd=fdfind
fi

alias enrun="LC_ALL=en_GB.utf8"
alias encalc="enrun libreoffice --calc"
alias dirs="dirs -v"
alias bd=". bd -si"
alias h=history
