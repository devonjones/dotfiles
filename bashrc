# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#export PATH=$PATH:$HOME/bin
#
#if [ -e ~/.employer ] ; then
#	source ~/.employer
#fi
#
#function include_d {
#	dir=$1
#	if [ -d $HOME/.$dir.d -a -r $HOME/.$dir.d -a -x $HOME/.$dir.d ]; then
#		for i in $HOME/.$dir.d/*.sh; do
#			 . $i
#		done
#	fi
#	include_os $dir
#	include_employer $dir
#}
#
#function include_os {
#	dir=$1
#	os="$(uname)"
#
#	if [ -d $HOME/.$dir.d/$os -a -r $HOME/.$dir.d/$os -a -x $HOME/.$dir.d/$os ]; then
#		for i in $HOME/.$dir.d/$os/*.sh; do
#			 . $i
#		done
#	fi
#	if [ "$os" == "Linux" ] ; then
#		include_distro $i
#	fi
#}
#
#function include_employer {
#	dir=$1
#
#	if [ -d $HOME/.$dir.d/$EMPLOYER -a -r $HOME/.$dir.d/$EMPLOYER -a -x $HOME/.$dir.d/$EMPLOYER ]; then
#		for i in $HOME/.$dir.d/$EMPLOYER/*.sh; do
#			 . $i
#		done
#	fi
#}
#
#function include_distro {
#	distro=""
#	if [ -e /etc/redhat-release ] ; then
#		distro=$(cat /etc/redhat-release | awk '{ print $1 }')
#	elif [ -e /usr/bin/lsb_release ] ; then
#		distro=$(lsb_release -i | awk '{ print $NF }')
#	fi
#
#	if [ "$distro" != "" ] ; then
#		if [ -d $HOME/.$dir.d/$distro -a -r $HOME/.$dir.d/$distro -a -x $HOME/.$dir.d/$distro ]; then
#			for i in $HOME/.$dir.d/$distro/*.sh; do
#				 . $i
#			done
#		fi
#	fi
#}

include_d bash_functions
include_d bash_aliases
include_d bash_completion
include_d bashrc
