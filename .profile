#!/bin/sh

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

# Include homebrew bin.
BREW_BIN=/home/linuxbrew/.linuxbrew/bin/brew
if [ -x "$BREW_BIN" ]; then
	eval "$($BREW_BIN shellenv)"
fi
