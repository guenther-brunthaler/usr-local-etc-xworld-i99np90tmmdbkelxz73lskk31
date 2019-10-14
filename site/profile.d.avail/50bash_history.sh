#! /bin/false
# Version 2019.286

if test -n "$BASH_VERSION"
then
	# Enable time stamps in bash history.
	export HISTTIMEFORMAT="{%F %T} "
	shopt -s histreedit histverify
fi
