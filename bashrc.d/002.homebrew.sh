# non-login bash doesn't read profile.d/002.homebrew.sh; pass bash since $SHELL may be zsh
if [[ -e /home/linuxbrew/.linuxbrew/bin/brew ]] ; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
fi

if [[ -e /opt/homebrew/bin/brew ]] ; then
    eval "$(/opt/homebrew/bin/brew shellenv bash)"
fi
