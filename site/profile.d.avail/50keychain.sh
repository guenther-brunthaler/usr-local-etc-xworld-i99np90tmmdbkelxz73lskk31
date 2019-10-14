# Searches for and connects to a running ssh-agent and/or gpg-agent
# for the current user. Auto-detects which agents are installed.
# If no agents are running for the current user yet, start new ones.

setup() {
	/usr/bin/keychain --quiet
	local S="$HOME/.keychain/$HOSTNAME-sh"
	test -r "$S" && . "$S"
}

setup
unset -f setup
