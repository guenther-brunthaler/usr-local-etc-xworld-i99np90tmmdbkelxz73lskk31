#! /bin/false
# Version 2019.287

case $- in
	*i*) ;;
	*) return
esac

test ! -x /usr/bin/dircolors && return
test ! -r ~/.dircolors && return

eval "`dircolors -b ~/.dircolors`" || eval "`dircolors -b`"
