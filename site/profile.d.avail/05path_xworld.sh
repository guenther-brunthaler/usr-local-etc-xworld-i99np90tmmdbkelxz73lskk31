#! /bin/false
# Add "xworld"-site binaries to $PATH.
#
# Version 2019.287
# Copyright (c) 2019 Guenther Brunthaler. All rights reserved.
#
# This script is free software.
# Distribution is permitted under the terms of the GPLv3.

pro_rWB858IAc1YUcQZ9628WWkgWP=$HOME/.cache/profile.vars

{
	test -f "$pro_rWB858IAc1YUcQZ9628WWkgWP" || (

# Create $pro_rWB858IAc1YUcQZ9628WWkgWP.
set -e
cachedir=`dirname -- "$pro_rWB858IAc1YUcQZ9628WWkgWP"`
test -d "$cachedir" \
	|| mkdir -m700 -- "$cachedir"
exec > "$pro_rWB858IAc1YUcQZ9628WWkgWP"

set --
uid=`id -u`
pfxlen=0
while read d
do
	wc=
	case $d in
		*=0) true =0;d=${d%=*}; test x"$uid" != x0 && continue;;
		+)
			true +;test -n "$pfxlen" && shift $pfxlen; pfxlen=$#
			continue
			;;
		:) true :;d=;;
		*"*"*) true wildcard;wc=y
	esac
	if test $pfxlen = 0
	then
		set -- "$@" "$d"
	else
		# Append $d to a copy of all prefixes.
		true outer;i=0
		while test $i != $pfxlen
		do
			true extract; # Extract ${i}th argument as $x.
			j=0
			while test $j != $#
			do
				c=$1; shift; set -- "$@" "$c"
				test $i = $j && x=$c
				j=`expr $j + 1`
			done
			# Make $x the augmented prefix element copy or a
			# wildcard pattern.
			true augment;x=$x${d:+/}$d
			if test -n "$wc"
			then
				true process wildcard;n=$#
				# Expand wildcard pattern and prepend result
				# set to $@.
				set -- `ls -d -- $x 2> /dev/null` "$@"
				# Did the wildcards actually get expanded?
				test x"$1" = x"$x" && shift
				# Move wildcard expansions to end of $@.
				true move to end;n=`expr $# - $n || :`
				while test $n != 0
				do
					c=$1; shift; set -- "$@" "$c"
					n=`expr $n - 1 || :`
				done
			else
				set -- "$@" "$x"
			fi
			i=`expr $i + 1`
		done
	fi
done << EOF
$HOME
$HOME/.local
/usr/local
/usr
+
sbin=0
bin
+
:
tmp
local
locally_merged
xworld
xworld_*
+
EOF
# Remove entries which do not actually exist or are already present in $PATH.
npath=
while test $# != 0
do
	c=$1; shift
	test -d "$c" || continue
	r=$PATH:
	while test -n "$r"
	do
		f=${r%%:*}; r=${r#*:}
		test x"$f" = x"$c" && continue 2
	done
	npath=$npath${npath:+:}$c
done
npath=$npath${npath:+${PATH:+:}}$PATH
echo "PATH_rWB858IAc1YUcQZ9628WWkgWP=\"$npath\""
)
} && {
	. "$pro_rWB858IAc1YUcQZ9628WWkgWP"
	test -n "$PATH_rWB858IAc1YUcQZ9628WWkgWP" \
		&& export PATH=$PATH_rWB858IAc1YUcQZ9628WWkgWP
}
unset pro_rWB858IAc1YUcQZ9628WWkgWP PATH_rWB858IAc1YUcQZ9628WWkgWP
