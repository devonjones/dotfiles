if [ -d "$HOME/.pyenv" ] ; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

export VIRTUAL_ENV_DISABLE_PROMPT=false

# UV
if [ -f "$HOME/.local/bin/env" ] ; then
    . $HOME/.local/bin/env
fi
