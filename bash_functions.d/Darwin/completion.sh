if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
fi
# auto-completion is not case sensitive anymore
set completion-ignore-case On

# Tab completion for sudo
complete -cf sudo
