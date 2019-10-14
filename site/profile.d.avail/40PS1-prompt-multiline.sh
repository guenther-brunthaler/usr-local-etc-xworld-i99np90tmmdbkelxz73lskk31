#! /bin/sh
# Set up a multi-line prompt where the current directory is shown in an
# individual line. This avoids making the shell prompt part in the line
# containing the cursor too long in case of a long current directory path. The
# prompt also includes any error return code from the last command immediately
# before the prompt indicator character.
#
# Version 2019.287.1
#
# Copyright (c) 2019 Guenther Brunthaler. All rights reserved.
#
# This script is free software.
# Distribution is permitted under the terms of the GPLv3.

case $- in
	*i*) ;;
	*) return
esac

if test -x /usr/bin/tput && tput setaf > /dev/null 2>& 1
then
	PS1='\n\[\033[0;33m\]cwd: \w\[\033[0m\]\n'
	PS1=$PS1'\[\033[1;3'`
		case \`id -u\` in
			0) echo 1;;
			*) echo 2
		esac
	`'m\]\u@\h\[\033[0m\]'
	PS1=$PS1' \[\033[37;41m\]${?#0}\[\033[1;40;34m\]\$\[\033[0m\] '
else
	PS1='\ncwd: \w\n'
	PS1=$PS1'\u@\h'
	PS1=$PS1' ${?#0}\$ '
fi
