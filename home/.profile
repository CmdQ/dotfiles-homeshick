#!/bin/sh

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

CARGO_HOME="$HOME/.cargo"
if [ -d "$CARGO_HOME/bin" ]; then
	PATH="$CARGO_HOME/bin:$PATH"
	export CARGO_HOME
fi

# Include homebrew bin.
BREW_BIN=/home/linuxbrew/.linuxbrew/bin/brew
if [ -x "$BREW_BIN" ]; then
	eval "$($BREW_BIN shellenv)"
fi

JULIA=/Applications/Julia-1.6.app/Contents/Resources/julia/bin
if [ -x "$JULIA" ]; then
	PATH="$PATH:$JULIA"
fi
