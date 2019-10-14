#! /bin/false
# Version 2019.286

if test -t 0
then
	# Make sure the terminal is not too wide.
	if test `tput cols || echo ${COLUMNS:-80}` -gt 100
	then
		stty cols 100
	fi
fi
