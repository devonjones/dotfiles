# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Non-login shells never read profile, so load the loader functions here too
if [ -f "$HOME/dotfiles/include_d" ]; then
	. "$HOME/dotfiles/include_d"
else
	echo "dotfiles: include_d missing" >&2
fi

include_d bashrc
# login shells already loaded ~/.local.d from profile
shopt -q login_shell || include_d local

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# atuin's bash hooks need bash-preexec to call them
[ -f ~/dotfiles/bash-preexec.sh ] && source ~/dotfiles/bash-preexec.sh
command -v atuin >/dev/null && eval "$(atuin init bash)"
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
