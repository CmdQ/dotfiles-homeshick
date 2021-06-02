# Easy or fully functional?

Docker and Kubernetes can run in WSL and connect to Docker Desktop running in Windows (k10s needs to be enabled in settings first).

The downside is there is no choosing versions. Also it's just k10s and not k3s for instance.

## Missing systemd

For that to run, WSL needs a running systemd. The nicest trick I found so far is [genie][]. It's built with .NET so it needs a few prerequisites first.

Microsoft's trust key and package repository can be installed via a DEB file.

The other repository to add is the [Transdebian][] one, a repository for WSL-only Debian packages. This is where `genie` is installed from.

After installation shut down WSL via `wsl.exe --shutdown`.

From now on start Linuxes with `wsl.exe -d Ubuntu genie -s` (that's also what I changed the command line in Terminal's Ubuntu profile to).

## Problems

If starting then takes a long time and shows many exclamation marks, some system units may be at fault. Known ones are documented in the [wiki][]. For me I had to empty `/etc/fstab` and disable _both_ `multipathd` services.

[genie]: https://github.com/arkane-systems/genie
[transdebian]: https://arkane-systems.github.io/wsl-transdebian/
[wiki]: https://github.com/arkane-systems/genie/wiki/Systemd-units-known-to-be-problematic-under-WSL