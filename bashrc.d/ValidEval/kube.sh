# pyenv activate only works once pyenv's shell function is loaded
[ "$(type -t pyenv)" = function ] && pyenv activate valid-eval &>/dev/null
