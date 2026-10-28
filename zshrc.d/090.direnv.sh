# direnv - automatic environment switching per directory
# https://direnv.net

if command -v direnv &> /dev/null; then
    eval "$(direnv hook zsh)"
fi
