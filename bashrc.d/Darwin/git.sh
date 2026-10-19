# git completion and prompt helpers ship with Apple's command line tools
for f in /Library/Developer/CommandLineTools/usr/share/git-core/{git-completion.bash,git-prompt.sh}; do
	[ -f "$f" ] && source "$f"
done
