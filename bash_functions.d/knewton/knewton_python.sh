if [ -f /usr/local/bin/virtualenvwrapper.sh ]
then
	export WORKON_HOME=/opt/virtualenvs
	source /usr/local/bin/virtualenvwrapper.sh
fi
if [ -f /usr/share/python/ns/virtualenvwrapper ]
then
	export WORKON_HOME=/opt/virtualenvs
fi

use_knewton_env() {
	typeset venv
	venv="$1"
	if [[ "${VIRTUAL_ENV:t}" != "knewton" ]]; then
		if [[ "${VIRTUAL_ENV:t}" != "$venv" ]]; then
			if workon | grep -q "$venv"; then
				workon "$venv"
			else
				echo -n "Create virtualenv $venv now? (Yn) "
				read answer
				if [[ "$answer" == "Y" ]]; then
					if [ -e "bin/create_virtualenv.sh" ]; then
						bin/create_virtualenv.sh
					elif [ -e "mgmt/virtualenv.sh" ]; then
						mgmt/virtualenv.sh
					elif [ -e "mgmt/common/virtualenv.sh" ]; then
						mgmt/common/virtualenv.sh
					fi
					workon "$venv"
				fi
			fi
		fi
	fi
}
