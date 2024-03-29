#!/bin/bash

command_exists () { type "$1" &> /dev/null ; }

function __git_branch {
	__git_ps1 "%s"
}

echoerr () { echo "$@" 1>&2; }

function __cluster_context {
	local NONE="\[\033[0m\]"    # unsets color to term's fg color

	# regular colors
	local K="\[\033[0;30m\]"    # black
	local R="\[\033[0;31m\]"    # red
	local G="\[\033[0;32m\]"    # green
	local Y="\[\033[0;33m\]"    # yellow
	local B="\[\033[0;34m\]"    # blue
	local M="\[\033[0;35m\]"    # magenta
	local C="\[\033[0;36m\]"    # cyan
	local W="\[\033[0;37m\]"    # white

	# emphasized (bolded) colors
	local EMK="\[\033[1;30m\]"
	local EMR="\[\033[1;31m\]"
	local EMG="\[\033[1;32m\]"
	local EMY="\[\033[1;33m\]"
	local EMB="\[\033[1;34m\]"
	local EMM="\[\033[1;35m\]"
	local EMC="\[\033[1;36m\]"
	local EMW="\[\033[1;37m\]"

	# background colors
	local BGK="\[\033[40m\]"
	local BGR="\[\033[41m\]"
	local BGG="\[\033[42m\]"
	local BGY="\[\033[43m\]"
	local BGB="\[\033[44m\]"
	local BGM="\[\033[45m\]"
	local BGC="\[\033[46m\]"
	local BGW="\[\033[47m\]"

	AWS=''
	if [[ -n "$AWS_PROFILE" ]]
	then
		AWS="${EMW}${AWS_PROFILE}$NONE"
	fi
	if command_exists kubectl ; then
		# Get current context
		CONTEXTS=$(kubectl config get-contexts | grep -- "*")
		read -a CTXARR <<< "$CONTEXTS"
		KCONTEXT=${CTXARR[2]}
		if [ -n "$KCONTEXT" ]; then
			KCONTEXT="$EMM${KCONTEXT}$NONE"
		fi

		KNAMESPACE=${CTXARR[4]}
		if [ -n "$KNAMESPACE" ]; then
			KNAMESPACE="$EMY${KNAMESPACE}$NONE"
		fi
	fi
	if [[ -n "$AWS" || -n "$KCONTEXT" || -n "$KNAMESPACE" ]] ; then
		echo "$EMM[$NONE${AWS} | ${KCONTEXT} | ${KNAMESPACE}$EMM]$NONE\n"
	fi
}

function set_prompt {
	exit_code=$?
	local NONE="\[\033[0m\]"    # unsets color to term's fg color

	# regular colors
	local K="\[\033[0;30m\]"    # black
	local R="\[\033[0;31m\]"    # red
	local G="\[\033[0;32m\]"    # green
	local Y="\[\033[0;33m\]"    # yellow
	local B="\[\033[0;34m\]"    # blue
	local M="\[\033[0;35m\]"    # magenta
	local C="\[\033[0;36m\]"    # cyan
	local W="\[\033[0;37m\]"    # white

	# emphasized (bolded) colors
	local EMK="\[\033[1;30m\]"
	local EMR="\[\033[1;31m\]"
	local EMG="\[\033[1;32m\]"
	local EMY="\[\033[1;33m\]"
	local EMB="\[\033[1;34m\]"
	local EMM="\[\033[1;35m\]"
	local EMC="\[\033[1;36m\]"
	local EMW="\[\033[1;37m\]"

	# background colors
	local BGK="\[\033[40m\]"
	local BGR="\[\033[41m\]"
	local BGG="\[\033[42m\]"
	local BGY="\[\033[43m\]"
	local BGB="\[\033[44m\]"
	local BGM="\[\033[45m\]"
	local BGC="\[\033[46m\]"
	local BGW="\[\033[47m\]"

	usercolor=$EMG
	if [ -n "$SSH_CLIENT" ]
	then
		usercolor=$EMC
	fi
	#if [[ $TERM =~ "256color" ]]; then
	#	host_color="38;5;$((16 + $(hostname | cksum | cut -c1-3) % 256))";
	#else
	#	host_color="1;$((31 + $(hostname | cksum | cut -c1-3) % 6))";
	#fi
	# set variable identifying the chroot you work in (used in the prompt below)
	if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
		debian_chroot=$(cat /etc/debian_chroot)
	fi

	virtualenv=''
	if [[ -n "$VIRTUAL_ENV" ]]
	then
		virtualenv="$EMR(`basename $VIRTUAL_ENV`)$NONE "
	fi
	cluster=$(__cluster_context)
	codecolor=$EMW
	if [ $exit_code -ne 0 ]
	then
		codecolor=$EMR
	fi
	if [ `id -u` = 0 ]
	then
		#root
		rootcolor=$EMR
		echo -ne "${debian_chroot:+($debian_chroot)}$rootcolor\u@\h$NONE $colorcode$exit_code$NONE $EMB\w \$$NONE "
	else
		fulldir="$EMB\w$NONE"
		cdup=`timeout 1 git rev-parse --show-cdup 2> /dev/null`
		if [ $? == 0 ]
		then
			color=$EMM
			timeout 1 git diff --quiet HEAD &>/dev/null 
			if [ $? == 1 ]
			then
				color=$R
			fi
			dir=$(cd "$cdup";pwd)
			pdir=`pwd`
			retract=${dir/$HOME/\~}
			local="${pdir/$dir/}/"
			untracked=''
			space=''
			if [ "x$(timeout 1 git stash list | head -n 1)" != "x" ]; then
				space=' '
				untracked="$EMY\$$NONE"
			fi
			if [ "x$(timeout 1 git status | grep Untracked)" != "x" ]; then
				space=' '
				untracked="$untracked$EMR%$NONE"
			fi
			fulldir="$EMB$retract$color$local $EMW\$(__git_branch)$space$untracked$NONE "
		else
			pdir=`pwd`
			retract=${pdir/$HOME/\~}
			fulldir="$EMB$retract$NONE "
		fi
		echo -ne "$cluster$virtualenv${debian_chroot:+($debian_chroot)}$usercolor\u@\h$NONE $codecolor$exit_code$NONE $fulldir$EMB\$$NONE $(eternal_history $exit_code)"
	fi
}

function eternal_history() {
	exit_code=$1
	echo $$ $USER $exit_code "$(history 1)" >> $HOME/.bash_eternal_history
}

#export GIT_PS1_SHOWDIRTYSTATE=1
#export GIT_PS1_SHOWSTASHSTATE=1
#export GIT_PS1_SHOWUNTRACKEDFILES=yes
export GIT_PS1_SHOWUPSTREAM="auto"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color) color_prompt=yes;;
	xterm-256color) color_prompt=yes;;
	xterm) color_prompt=yes;;
	screen) color_prompt=yes;;
esac

#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	export PROMPT_COMMAND='PS1="$(set_prompt)"'
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
	PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
	;;
*)
	;;
esac

