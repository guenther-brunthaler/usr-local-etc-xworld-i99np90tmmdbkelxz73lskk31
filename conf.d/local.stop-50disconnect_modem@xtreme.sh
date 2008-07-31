#!/bin/false


# Checks whether a modem connection is active
# and disconnects if this is the case.


cleanup_l5urjd8tqdsx1ujh89hz02pxj() {
	local PIDFILE PID
	for PIDFILE in /var/run/ppp-hui-umts.pid /var/run/ppp-hui-gsm.pid; do
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
	done
}


cleanup_l5urjd8tqdsx1ujh89hz02pxj
unset -f cleanup_l5urjd8tqdsx1ujh89hz02pxj
