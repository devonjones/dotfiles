# Installation

```
git submodule update --init --recursive
./install
```

## FZF
[fzf](https://github.com/junegunn/fzf#installation)
Used for fuzzy completion.  This is a dependency for many things below, but also makes the shell easier to use.

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

Restart your shell.

# Python
## Pyenv
[pyenv](https://github.com/pyenv/pyenv)
This lets you have multiple python installations, gets you off of the system python and makes dealing with virtualenvs easier.  You will also get the active virtualenv in your prompt

```zsh
sudo apt install wget build-essential libreadline-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev lzma-dev
curl https://pyenv.run | bash
pyenv install -l | less # Look for the lastest stable 3.x.  At time of writing 3.10.10
pyenv install 3.10
pyenv global 3.10
```

Restart your shell.

### pyenv-virtualenv
[pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)
Allows every python program to have a completely isolated environment, so no library leakage from app to app.

```
pip install virtualenv # You neeed to do this inside each python you install above

pyenv virtualenv valid-eval
pyenv activate valid-eval
```

add the following to the end of ~/.zshrc

```
pyenv activate valid-eval
```

Restart your shell.

### zsh
[oh my zsh: pyenv](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/pyenv/pyenv.plugin.zsh)
[oh my zsh: pip](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/pip)
Adds tab completion and some aliases.

edit ~/.zshrc and add pyenv to plugins

```zsh
plugins=(pyenv pip ...)
```

You may need to add some config to your .zprofile

```zsh
# pyenv

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
```

Restart your shell.

# Node
## NVM
[nvm](https://github.com/nvm-sh/nvm)
Lets us have multiple copies of node, and isolates them.

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
```

Restart your shell.

```
nvm install 16
```

### zsh
[oh my zsh: nvm](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm)
Adds tab completion and some aliases.

edit ~/.zshrc and add nvm to plugins

```zsh
plugins=(nvm ...)
```

Restart your shell.

# Ruby
## rvm
[rvm](https://github.com/rbenv/rbenv)
Lets us have multiple copies of ruby, and isolates them.

```
sudo apt install libyaml-dev
curl -sSL https://get.rvm.io | bash
```

Restart your shell.

```
rvm install 3.2
```

### zsh
[oh my zsh: rvm](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rvm)
Adds tab completion and some aliases.

edit ~/.zshrc and add rvm to plugins

```zsh
plugins=(rvm ...)
```

Restart your shell.