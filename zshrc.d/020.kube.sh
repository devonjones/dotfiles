
# Kubectl
command -v kubectl >/dev/null && source <(kubectl completion zsh)

# Flux
command -v flux >/dev/null && . <(flux completion zsh)

alias kc=kubecolor

compdef kubecolor=kubectl
