_smartsend() {
	local cur prev opts base
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"

	# top level options
	opts="-e -h --help --version redis riak smartsendd"

	case "${prev}" in
		-e)
			local envs=$(ls ~/.smartsend/ | sed -e 's/\..*$//')
			COMPREPLY=( $(compgen -W "${envs}" -- ${cur}) )
			return 0
			;;
		redis)
			local redis="servers del get set hdel hexists hget hgetall hkeys hlen hset info clear scan fake"
			COMPREPLY=( $(compgen -W "${redis}" -- ${cur}) )
			return 0
			;;
		riak)
			local redis="servers del get set fake"
			COMPREPLY=( $(compgen -W "${redis}" -- ${cur}) )
			return 0
			;;
		smartsendd)
			local smartsendd="servers health traffic config status predict debug"
			COMPREPLY=( $(compgen -W "${smartsendd}" -- ${cur}) )
			return 0
			;;
		servers)
			local smartsendd="--ip --fqdn"
			COMPREPLY=( $(compgen -W "${smartsendd}" -- ${cur}) )
			return 0
			;;
		*)
		;;
	esac
	for word in "${COMP_WORDS[@]}" ; do
		if [[ $word == "fake" ]]; then return 0; fi
	done
	COMPREPLY=($(compgen -W "${opts}" -- ${cur}))  
	return 0
}
complete -o default -F _smartsend smartsend
