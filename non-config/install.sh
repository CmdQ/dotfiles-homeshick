#!/bin/sh

echo
echo ATTENTION: Did you remember to init submodules?
echo "If not, ctrl-c out now and do so."
echo

prompt() {
    echo
    while true; do
        printf %s "${1:-"Continue?"} [Yes/No] "
        read -r yn
        case $yn in
            [Yy]*) 
                echo
                return 0
                ;;
            [Nn]*) 
                echo
                return 1
                ;;
            *) echo "Please answer yes or no.";;
        esac
    done
}

there() {
    command -v "$1" >/dev/null 2>&1
}

if there apt-get; then
    if prompt "Install apt packages from apt.get?"; then
        sudo apt-get update && sudo xargs apt-get install -y --no-install-recommends <apt.txt
    fi
else
    echo No apt, this doesn\'t seem Debian-based.
    echo This script needs work.
    exit 1
fi

prompt "Set zsh as your shell?" && chsh -s "$(command -v zsh)"

echo Console \& language setup:
echo We want DE, GB, and US all with UTF-8.
prompt "Run dpkg-reconfigure locales?" && sudo dpkg-reconfigure locales

if ! there brew; then
    if prompt "Install Homebrew?"; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
fi
[ -x /home/linuxbrew/.linuxbrew/bin/brew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
if there brew; then
    brew analytics off
    if prompt "Install brew packages?"; then
        xargs brew install <homebrew.txt
    fi
fi

# pyenv after brew!
if there pyenv && prompt "Install system packages for pyenv to build Python?"; then
    sudo xargs apt-get install -y --no-install-recommends <pyenv.apt
fi

if there cargo && prompt "Install cargo packages?"; then
    xargs cargo install <cargo.txt
fi
