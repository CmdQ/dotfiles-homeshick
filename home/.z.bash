#!/usr/bin/env bash

# Or do we want a more potent alternative?
# https://github.com/deadc0de6/dotdrop

if [[ -r "$HOME/.homesick/repos/homeshick/homeshick.sh" ]]; then
    source "$HOME/.homesick/repos/homeshick/homeshick.sh"
else
    echo Install homeshick with
    echo git clone git://github.com/andsens/homeshick.git "$HOME/.homesick/repos/homeshick"
fi

find_windows_ip_for_display() {
    if [[ -n $WSL_INTEROP ]]; then
        local nic_wsl="vEthernet (WSL)"
        local nic_hyperv="vEthernet (Default Switch)"
        if netsh.exe interface ip show interfaces | grep -qF "$nic_wsl"; then
            DISPLAY=$(netsh.exe interface ip show address "$nic_wsl" | sed -nE 's/^\s+IP[^:]+:\s+([0-9.]+)\s+/\1/p'):0.0
        elif netsh.exe interface ip show interfaces | grep -qF "$nic_hyperv"; then
            DISPLAY=$(netsh.exe interface ip show address "$nic_hyperv" | sed -nE 's/^\s+IP[^:]+:\s+([0-9.]+)\s+/\1/p'):0.0
        fi
        export DISPLAY
    fi
}

find_windows_ip_for_display

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
    find . -type f -name '*:Zone.Identifier' -delete
}

entr-py() {
    false || while (( $? == 1 || $? == 2 )); do fdfind -e py | entr -ds 'isort . && black .'; done
}
