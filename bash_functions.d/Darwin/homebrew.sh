
# Use homebrew python
export PATH=/usr/local/share/python:$PATH
# Default to homebrew utils over OSX
export PATH=/usr/local/bin:$PATH
# Default to GNU tools over BSD
#export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Fixing man
alias man='_() { echo $1; man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1 1>/dev/null 2>&1;  if [ "$?" -eq 0 ]; then man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1; else man $1; fi }; _'

