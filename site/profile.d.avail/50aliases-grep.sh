#! /bin/false
# Version 2019.333

case $- in
	*i*) ;;
	*) return
esac

if echo | command grep -q --color=auto ^ > /dev/null 2>& 1
then
	alias grep="grep --color=auto"
fi
