function grep {
	GREP_OPTIONS="--exclude-dir=\.svn --exclude-dir=log --exclude-dir=\.git"
	command grep "$GREP_OPTIONS" "$@"
}
