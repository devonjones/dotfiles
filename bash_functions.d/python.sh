
use_env() {
	typeset venv
	venv="$1"
	if [[ "${VIRTUAL_ENV:t}" != "$venv" ]]; then
		if workon | grep -q "$venv"; then
			workon "$venv"
		else
			echo -n "Create virtualenv $venv now? (Yn) "
			read answer
			if [[ "$answer" == "Y" ]]; then
				mkvirtualenv "$venv"
				workon "$venv"
			fi
		fi
	fi
}
