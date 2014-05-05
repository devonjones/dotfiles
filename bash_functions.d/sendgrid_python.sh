if [ -f /usr/local/bin/virtualenvwrapper.sh ]
then
	export WORKON_HOME=$HOME/.virtualenvs
	source /usr/local/bin/virtualenvwrapper.sh
fi
if [ -f /usr/share/python/ns/virtualenvwrapper ]
then
	export WORKON_HOME=$HOME/.virtualenvs
fi

