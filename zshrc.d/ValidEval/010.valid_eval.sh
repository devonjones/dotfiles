# If in TMUX, pick an AWS profile from the window name
if [ -n "${TMUX_PANE}" ] ; then
	local window=`tmux list-panes -a -F '#W #{pane_id}' | grep "${TMUX_PANE}" | awk '{print $1}'`
	case "$window" in
		*com-p*) export AWS_PROFILE=com-production-sso ;;
		*com-t*) export AWS_PROFILE=com-test-sso ;;
		*il2-p*) export AWS_PROFILE=il2-production-sso ;;
		*il2-s*) export AWS_PROFILE=il2-staging-sso ;;
		*test*) export AWS_PROFILE=com-test-sso ;;
	esac
fi

# If in a kubie shell, pick an AWS profile from the kube context
if [[ "${KUBIE_ACTIVE}" -eq 1 ]] ; then
	local context="$(kubie info ctx)"
	case "$context" in
		*-com-prd) export AWS_PROFILE=com-production-sso ;;
		*-com-test|*test*) export AWS_PROFILE=com-test-sso ;;
		*prod*|*prd*|*production*) export AWS_PROFILE=il2-production-sso ;;
		*stage|*stg*|*staging*) export AWS_PROFILE=il2-staging-sso ;;
		*) export AWS_PROFILE=com-test-sso ;;
	esac
fi

export VIRTUAL_ENV_DISABLE_PROMPT=false
pyenv activate valid-eval &>/dev/null

watchEvents() {
  watch -n 0.5 "kubectl get events -n $1 --sort-by='.metadata.creationTimestamp' | tail -32"
}
alias we=watchEvents
