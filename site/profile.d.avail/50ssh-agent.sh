# Searches for and connects to a running ssh-agent for the current user.
# If no ssh-agent is running for the current user yet, start a new one.
# Does not care about gpg-agent.
# Use 50keychain rather than this snippet if you also need gpg-agent.

setup() {
	/usr/bin/keychain --quiet --agents ssh
	local S="$HOME/.keychain/$HOSTNAME-sh"
	test -r "$S" && . "$S"
}

setup
unset -f setup
