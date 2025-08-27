# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

if [ -e ~/.employer ] ; then
	source ~/.employer
fi

export PATH=$PATH:$HOME/bin

function include_d {
	dir=$1
	if [ -d $HOME/.$dir.d -a -r $HOME/.$dir.d -a -x $HOME/.$dir.d ]; then
		for i in $HOME/.$dir.d/*.sh; do
			 . $i
		done
	fi
	include_os $dir
	include_employer $dir
}

function include_os {
	dir=$1
	os="$(uname)"

	if [ -d $HOME/.$dir.d/$os -a -r $HOME/.$dir.d/$os -a -x $HOME/.$dir.d/$os ]; then
		for i in $HOME/.$dir.d/$os/*.sh; do
			 . $i
		done
	fi
	if [[ "$os" == "Linux" ]] ; then
		include_distro $dir
		include_wsl $dir
	fi
}

function include_employer {
	dir=$1

	if [ -d $HOME/.$dir.d/$EMPLOYER -a -r $HOME/.$dir.d/$EMPLOYER -a -x $HOME/.$dir.d/$EMPLOYER ]; then
		for i in $HOME/.$dir.d/$EMPLOYER/*.sh; do
			 . $i
		done
	fi
}

function include_distro {
	dir=$1
	distro=""
	if [ -e /etc/redhat-release ] ; then
		distro=$(cat /etc/redhat-release | awk '{ print $1 }')
	elif [ -e /usr/bin/lsb_release ] ; then
		distro=$(lsb_release -i | awk '{ print $NF }')
	fi

	if [ "$distro" != "" ] ; then
		if [ -d $HOME/.$dir.d/$distro -a -r $HOME/.$dir.d/$distro -a -x $HOME/.$dir.d/$distro ]; then
			for i in $HOME/.$dir.d/$distro/*.sh; do
				 . $i
			done
		fi
	fi
}

function include_wsl {
	dir=$1
	wsl="$(uname -a)"

	if [[ $wsl =~ "WSL2" ]] ; then
		if [ -d $HOME/.$dir.d/WSL2 -a -r $HOME/.$dir.d/WSL2 -a -x $HOME/.$dir.d/WSL2 ] ; then
			for i in $HOME/.$dir.d/WSL2/*.sh; do
				. $i
			done
		fi
	fi
}

include_d profile

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

. "$HOME/.local/bin/env"
