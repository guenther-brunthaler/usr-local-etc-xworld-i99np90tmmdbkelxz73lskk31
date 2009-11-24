#! /bin/false


test x"${RC_GOT_FUNCTIONS}" != x"yes" && . /sbin/functions.sh
(
	SVCNAME=squid
	if test -f /etc/init.d/"$SVCNAME"
	then
		test -f /etc/conf.d/"$SVCNAME" && . /etc/conf.d/"$SVCNAME"
		. /etc/init.d/"$SVCNAME"
		stop
	fi
)
