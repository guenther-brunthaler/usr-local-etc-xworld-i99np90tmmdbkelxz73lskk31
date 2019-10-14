#! /bin/sh
# Version 2019.286

if test -t 0
then
	# Ensure no one can mess with this terminal by default.
	mesg n 2> /dev/null || :
fi
