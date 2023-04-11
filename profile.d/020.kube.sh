
# Krew
if [ -d "$HOME/.krew" ] ; then
    export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi

if command -v kubectl &> /dev/null
then
    alias k=kubectl
fi