# Re-initialize shell from current global environment.
alias reload-env="`
	set --
	test -n "$BASH_VERSION" && set -- "$@" ~/.bash_profile ~/.bashrc
	set -- "$@" ~/.profile
	test -n "$ENV" && set -- "$@" $ENV
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
