#!/usr/bin/bash

ls=ls
if command -v lsd &>/dev/null; then
	ls=lsd
	alias ls="$ls"
	alias l="$ls -l --group-dirs=first"
	alias ll="$ls -la --group-dirs=first"
	alias ld="$ls -lt --date=relative"
	alias lt="$ls --tree"
else
	alias l="$ls -l"
	alias ll="$ls -la"
	alias ld="$ls -lt"
fi
alias la="$ls -a"

if command -v nvim &>/dev/null; then
	alias vim=nvim
    export EDITOR=nvim
elif command -v vim &>/dev/null; then
    export EDITOR=vim
elif command -v joe &>/dev/null; then
    export EDITOR=joe
elif command -v nano &>/dev/null; then
    export EDITOR=nano
fi

if command -v fdfind &>/dev/null; then
	alias fd=fdfind
fi

alias enrun="LC_ALL=en_GB.utf8"
alias encalc="enrun libreoffice --calc &>/dev/null &"
alias h=history
alias ppup="python3 -m pip install --upgrade pip"
