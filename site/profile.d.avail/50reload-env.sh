# Re-initialize shell from current global environment.
# Version 2019.287

alias reload-env="`
	set --
	test -n "$BASH_VERSION" && set -- "$@" ~/.bash_profile
	set -- "$@" ~/.profile
	test -n "$ENV" && set -- "$@" $ENV
	test -n "$BASH_VERSION" && set -- "$@" ~/.bashrc
	found=
	for e
	do
		test -f "$e" && { found=y; break; }
	done
	set --
	test -n "$found" && set -- "$e"
	test -f /etc/profile && set -- /etc/profile "$@"
	case $# in
		1) x="\"$1\"";;
		2) x="\"$1\" and \"$2\"";;
		*) x="nothing"
	esac
	x="echo 'Sourcing $x.'"
	for sh
	do
		x="$x; . $sh"
	done
	echo "$x"
`"
