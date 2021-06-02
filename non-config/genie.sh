#!/bin/sh

if [ $(id -u) -ne 0 ]; then
    echo Run with sudo!
    exit 1
fi

apt-get update && apt-get install -y --no-install-recommends apt-transport-https

curl -fOL https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb && rm packages-microsoft-prod.deb

wget -O /etc/apt/trusted.gpg.d/wsl-transdebian.gpg https://arkane-systems.github.io/wsl-transdebian/apt/wsl-transdebian.gpg
chmod a+r /etc/apt/trusted.gpg.d/wsl-transdebian.gpg

cat <<EOF >/etc/apt/sources.list.d/wsl-transdebian.list
deb https://arkane-systems.github.io/wsl-transdebian/apt/ $(lsb_release -cs) main
deb-src https://arkane-systems.github.io/wsl-transdebian/apt/ $(lsb_release -cs) main
EOF

apt-get update && apt-get install -y --no-install-recommends systemd-genie
