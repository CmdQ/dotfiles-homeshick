#!/bin/sh

if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.poetry/bin" ]; then
	PATH="$HOME/.poetry/bin:$PATH"
fi

CARGO_HOME="$HOME/.cargo"
if [ -d "$CARGO_HOME/bin" ]; then
	PATH="$CARGO_HOME/bin:$PATH"
	export CARGO_HOME
fi

brew_bin=/home/linuxbrew/.linuxbrew/bin/brew
if [ -x "$brew_bin" ]; then
	eval "$($brew_bin shellenv)"
fi
unset brew_bin

julia_mac_dir=/Applications/Julia-1.6.app/Contents/Resources/julia/bin
if [ -x "$julia_mac_dir" ]; then
	PATH="$julia_mac_dir:$PATH"
fi
unset julia_mac_dir
fi

export PATH
export DOT_PROFILE_WAS_READ=true
