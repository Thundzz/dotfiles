# Configuration file repo

This repo contains various handy configuration files.
It is not very often updated and is more of a backup of my useful stuff  rather than a bleeding edge always up-to-date version of my configuration.

# Using Stow

## Installing GNU Stow on windows

* Install stow binaries for MSYS2 (add stow to path)
* Archive can be found here : https://ftp.gnu.org/gnu/stow/
* Copy includes for stow in perl vendor directory to the git for windows directory (C:\Program Files\Git\usr\lib\perl5\vendor_perl)
  * As of the writing of this readme, only the two files `Stow.pm` and `Stow.pm.in` are required
* Enable windows symlinks by default on MSYS2 using environment variable, you can do this through this alias:

```
alias stow='MSYS="winsymlinks:nativestrict" stow'
```

## Deploying config files on windows

To deploy the "windows" package for example, you can use:

```bash
stow  windows -t ~
```

You need admin privileges to create windows symlinks.
