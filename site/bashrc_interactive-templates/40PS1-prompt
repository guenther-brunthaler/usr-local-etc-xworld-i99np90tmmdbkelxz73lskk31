#! /bin/false
# Provide a useful prompt; different for root and other users.
# See the comments below in setprompt() to figure out
# which part of the prompt has which meaning.


# Generate dynamic parts of the prompt at runtime.
# Will be called by BASH when evaluating the $PS1 string.
# Must not generate any prompt-specific escape sequences.
PS1_nlxbsjpdq50evzj6zaaprqrat() {
	case $1 in
		shlvl)
			test -z "$SHLVL" && return
			# Display the amount of shell-nesting which exceeds
			# the "normal" nesting.
			# This "normal" nesting is 1 for top-level terminals
			# including "screen"-sessions and X11 terminals.
			local EFFLVL
			EFFLVL=$SHLVL
			if test x"${TERM%%.*}" = x"screen"
			then
				EFFLVL=`expr $EFFLVL - 1`
			fi
			if test -n "$WINDOWID"
			then
				EFFLVL=`expr $EFFLVL - 1`
			fi
			test "$EFFLVL" -gt 1 && echo "[$EFFLVL]"
		;;
		dirnst)
			test -z "$BASH_VERSION" && return
			# The "pushd" directory nesting level is indicated
			# by that number of "+"'s.
			local LEVEL DEPTH
			LEVEL=2
			eval 'DEPTH=${#DIRSTACK[*]}'
			while test $LEVEL -le $DEPTH
			do
				printf '+'
				LEVEL=`expr $LEVEL + 1`
			done
		;;
		umask)
			# Display umask if not identical to $2.
			local UMASK
			UMASK=`umask`
			test x"$UMASK" = x"$2" || echo " umask($UMASK)"
		;;
	esac
}


# Try to construct the PS1 string.
# Will be constructed from PS1-specific escape-sequences
# and callbacks to the helper function for dynamic sections.
# (Unfortunately, PS1-escapes cannot be generated from within the helper
# function, because they are interpreted by BASH only before the helper
# function is called, and must thus be static parts of the PS1 string.)
genPS1_nlxbsjpdq50evzj6zaaprqrat() {
	# Colors: 1=red, 2=green, 3=yellow, 4=blue, 5=purple, 6=cyan, 7=white.
	local USERCOLOR BASECOLOR EMCOLOR ALERTCOLOR USERCOLOR ROOTCOLOR
	BASECOLOR=4
	EMCOLOR=5
	ALERTCOLOR=3
	USERCOLOR=2
	ROOTCOLOR=1
	if test x"$TERM" = x'dumb'
	then
		# Do not set PS1 for dumb terminals or shells other than BASH.
		unset -f PS1_nlxbsjpdq50evzj6zaaprqrat
		return
	fi
	local ISROOT P C0 C1 C2 H1 H2 ALERT GROUP
	ISROOT=; P=
	if test x"`/usr/bin/whoami`" = x"root" || test x"$EUID" = x"0"
	then
		ISROOT=1
	fi
	test -n "$ISROOT" && USERCOLOR=$ROOTCOLOR
	C0="\[\033[01;"
	C1="${C0}3"
	C2="m\]"
	H1='`PS1_nlxbsjpdq50evzj6zaaprqrat'
	H2='`'
	# Set current color to that for user.
	P=$P$C1$USERCOLOR$C2
	# Add user name (skip if root and no group display necessary).
	GROUP=`id -gn`
	ALERT=; test x"`id -un`" = x"$GROUP" || ALERT=1
	if test -z "$ISROOT" || test -n "$ALERT"
	then
		P="$P\u"
		# Add group name if user's primary group is
		# not the same as user's private group.
		if test -n "$ALERT"
		then
			P=$P:$C1$ALERTCOLOR$C2$GROUP$C1$USERCOLOR$C2
		fi
		# Insert an at-sign between user/group names and host name.
		P="$P@"
	fi
	# Host name.
	P="$P\h"
	# Add shell nesting level.
	P="$P$H1 shlvl$H2"
	# Switch to base color.
	P=$P$C1$BASECOLOR$C2
	# Display and emphasize non-standard umasks.
	P="$P$C1$EMCOLOR$C2$H1 umask `umask`$H2$C1$BASECOLOR$C2"
	# Basename of current working directory.
	P="$P \W "
	# Directory nesting.
	P="$P$H1 dirnst$H2"
	# Add prompt character.
	# The prompt character will either be '$' for normal users,
	# or '#' for privileged users.
	P="$P\\$"
	# Prompt character and stop coloring.
	P="$P${C0}00$C2 "
	# Finally set what we have constructed.
	PS1=$P
	export PS1
}


genPS1_nlxbsjpdq50evzj6zaaprqrat
unset -f genPS1_nlxbsjpdq50evzj6zaaprqrat
