#export KUBECONFIG=~/.kube/ve-sandbox

source <(kubectl completion bash)
source <(flux completion bash)

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

pyenv activate valideval
