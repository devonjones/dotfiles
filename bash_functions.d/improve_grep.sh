function grep {
	command grep "--exclude-dir=\.svn --exclude-dir=log --exclude-dir=\.git" "$@"
}
