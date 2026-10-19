# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

__zprofile=true

if [ -e ~/.employer ] ; then
	source ~/.employer
fi

export PATH=$PATH:$HOME/bin

if [ -f "$HOME/dotfiles/include_d" ]; then
	. "$HOME/dotfiles/include_d"
else
	echo "dotfiles: include_d missing" >&2
fi

include_d profile
include_d local
