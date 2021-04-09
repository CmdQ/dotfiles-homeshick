#!/usr/bin/env bash

# Or do we want a more potent alternative?
# https://github.com/deadc0de6/dotdrop

if [[ -r "$HOME/.homesick/repos/homeshick/homeshick.sh" ]]; then
    source "$HOME/.homesick/repos/homeshick/homeshick.sh"
else
    echo Install homeshick with
    echo git clone git://github.com/andsens/homeshick.git "$HOME/.homesick/repos/homeshick"
fi

if [[ -n $WSL_INTEROP ]]; then
    nic_wsl="vEthernet (WSL)"
    nic_hyperv="vEthernet (Default Switch)"
    if netsh.exe interface ip show interfaces | grep -qF "$nic_wsl"; then
	    DISPLAY=$(netsh.exe interface ip show address "$nic_wsl" | sed -nE 's/^\s+IP[^:]+:\s+([0-9.]+)\s+/\1/p'):0.0
    elif netsh.exe interface ip show interfaces | grep -qF "$nic_hyperv"; then
	    DISPLAY=$(netsh.exe interface ip show address "$nic_hyperv" | sed -nE 's/^\s+IP[^:]+:\s+([0-9.]+)\s+/\1/p'):0.0
    fi
	export DISPLAY
fi

SKIM_DEFAULT_COMMAND="fd --type f || git ls-tree -r --name-only HEAD || rg --files || find ."

# My own commands:

mkcd() {
    if (($# != 1)); then
        echo 'Provide name of directory(/chain) as the only argument.'
    else
        mkdir -p "$1" && cd "$1" || echo "Couldn't create directory."
    fi
}

rmzi() {
    rm -f ./*:Zone.Identifier
}

entr-py() {
    (exit 2) || while (($? == 2)); do fd -e py | entr -ds 'isort . && black .'; done
}
