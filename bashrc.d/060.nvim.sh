# real vim stays reachable as \vim or /usr/bin/vim
if command -v nvim >/dev/null ; then
    export EDITOR=nvim VISUAL=nvim
    alias vim=nvim
fi
