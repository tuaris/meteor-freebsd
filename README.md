# Meteor Installer for FreeBSD

This is a set of scripts and patches to install the latest version of Meteor on FreeBSD 10.3 64-bit.  For detailed instrcutions please see http://www.unibia.com/unibianet/freebsd/install-meteor-freebsd

## Dependencies

This script was tested in FreeBSD 10.3 64-bit.

Before you can run the install process you must first ensure your system has the required packages.  You can skip over this section if you already have the required dependencies installed.

### Install Packages

Make sure you have the following packages installed:

```sh
pkg install -y mongodb32 node4 git-lite gmake python bash
```

### Install npm

Install the www/npm3 custom port that is included in this repository.  This custom port simply uses `www/node4` as the backend instead of `www/node`.

This is required until the port maintainer adds the option.

```sh
fetch https://raw.githubusercontent.com/tuaris/meteor-freebsd/master/dependencies/npm3.shar
sh npm3.shar
cd npm3
make install clean
```

See the [troubleshooting](TROUBLESHOOTING.md) document if you are having problems installing these ports and packages.

## Install Instructions

Proceed only if you have the dependencies above completed.

```
fetch https://raw.githubusercontent.com/tuaris/meteor-freebsd/master/install.sh
sh install.sh
```
