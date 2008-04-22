#!/bin/false


# Checks whether a modem connection is active
# and disconnects if this is the case.


cleanup_l5urjd8tqdsx1ujh89hz02pxj() {
	local PIDFILE PID
	PIDFILE="/var/run/ppp-hui.pid"
	if [ -f "$PIDFILE" ]; then
		PID=`head -n1 "$PIDFILE"`
		if [ -d "/proc/$PID" ]; then
			ebegin "Disconnecting modem"
			kill -HUP $PID
			while [ -e "$PIDFILE" ]; do
				sleep 1
			done
			eend $?
		fi
	fi
}


cleanup_l5urjd8tqdsx1ujh89hz02pxj
unset -f cleanup_l5urjd8tqdsx1ujh89hz02pxj
