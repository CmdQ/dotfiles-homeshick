# Or do we want a more potent alternative?
# https://github.com/deadc0de6/dotdrop
if [[ -r "$HOME/.homesick/repos/homeshick/homeshick.sh" ]]; then
    source "$HOME/.homesick/repos/homeshick/homeshick.sh"
    homeshick refresh 2 # Check every other day for an update.
else
    echo Install homeshick with
    echo git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
fi

if [[ -n $WSL_INTEROP ]]; then
	#DISPLAY=$(grep nameserver /etc/resolv.conf | sed 's/.* //'):0.0
    local nic_wsl="vEthernet (WSL)"
    local nic_hyperv="vEthernet (Default Switch)"
    if netsh.exe interface ip show interfaces | grep -qF "$nic_wsl"; then
	    DISPLAY=$(netsh.exe interface ip show address "$nic_wsl" | sed -nE 's/^\s+IP[^:]+:\s+([0-9.]+)\s+/\1/p'):0.0
    elif netsh.exe interface ip show interfaces | grep -qF "$nic_hyperv"; then
	    DISPLAY=$(netsh.exe interface ip show address "$nic_hyperv" | sed -nE 's/^\s+IP[^:]+:\s+([0-9.]+)\s+/\1/p'):0.0
    fi
	export DISPLAY
fi

# My own commands:

function mkcd {
    if (($# != 1)); then
        echo 'Provide name of directory(/chain) as the only argument.'
    else
        mkdir -p "$1" && cd "$1" || echo "Couldn't create directory."
    fi
}

function rmzi {
    rm -f *:Zone.Identifier
}

function wentr {
    local lockfile=entr.do
    local ext=${1:?Need at least an extension to work with.}
    shift
    local folder=$*
    if [[ -z $folder ]]; then
        if [[ -e src ]]; then
            folder=src
        fi
        if [[ -e tests ]]; then
            folder="$folder tests"
        fi
        if [[ -e test ]]; then
            folder="$folder test"
        fi
    fi
    if [[ -z $folder ]]; then
        echo No folders given.
    else
        if [[ -e $lockfile ]]; then
            echo There\'s already an $lockfile file, doing nothing.
        else
            touch $lockfile
            while [[ -e $lockfile ]]; do
                find . -name "*.$ext" | entr -dns "echo $folder"
                sleep 1
            done
            [[ -e $lockfile ]] && rm $lockfile
        fi
    fi
}

function wendr {
    local lockfile=entr.do
    [[ -e $lockfile ]] && rm $lockfile
    pkill entr
}