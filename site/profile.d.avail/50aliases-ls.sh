#! /bin/false
# Version 2019.287

case $- in
	*i*) ;;
	*) return
esac

alias ls="ls --color=auto"
alias la="ls --color=auto -A"

case `id -u` in
0)
	alias ll="ls -l --color=auto"
	alias lla="ls -l --color=auto -A"
	;;
*)
	alias ll="ls -go --color=auto"
	alias lla="ls -go --color=auto -A"
esac
