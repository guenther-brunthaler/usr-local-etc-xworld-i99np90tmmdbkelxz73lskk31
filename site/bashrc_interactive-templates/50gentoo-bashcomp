#! /bin/false

# Enable bash completion support if a $HOME/.bash_completion.d directory
# exists.
#
# But even then bash-completion can be disabled explicitely by creating a tag
# file "$HOME/.bash_completion.d/DISABLED".
#
# That tag file will only be recognized as such if it has a length of zero
# bytes (such as if created by "touch").
#
# Also, bash completion support will only be enabled for interactive shells,
# i. e. not for background shell batch processes.
#
# Written in 2008 by Guenther Brunthaler.


(
	case "$-" in
		*i*) ;;
		*) exit 1;; # Not interactive.
	esac
	test -f /etc/profile.d/bash-completion || exit
	TAGFILE=$HOME/.bash_completion.d/DISABLED
	DIR=${TAGFILE%/*}
	test -n "$HOME" && test -d "$DIR" || exit
	if test -e "$TAGFILE"; then
		test ! -f "$TAGFILE" || test -s "$TAGFILE"
	fi
) && . /etc/profile.d/bash-completion
