VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python

if [ -f /usr/local/bin/virtualenvwrapper.sh ]
then
	export WORKON_HOME=$HOME/.virtualenvs
	source /usr/local/bin/virtualenvwrapper.sh
fi
if [ -f /usr/share/python/ns/virtualenvwrapper ]
then
	export WORKON_HOME=$HOME/.virtualenvs
fi

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
