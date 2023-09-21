# If not running interactively, don't do anything
[ -z "$PS1" ] && return

include_d bashrc

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
