#!/bin/false


# Checks whether a modem connection is active
# and disconnects if this is the case.


(
	for PIDFILE in huiconnect ppp-one-hui; do
		PIDFILE=/var/run/$PIDFILE.pid
		if test -f "$PIDFILE"; then
			PID=`head -n1 "$PIDFILE"`
			if test -d "/proc/$PID"; then
				ebegin "Disconnecting modem"
				kill -HUP $PID 2> /dev/null
				while test -e "$PIDFILE"; do
					sleep 1
				done
				eend $?
			else
				# Obviously, the server died.
				# Clean up the PID file.
				rm "$PIDFILE"
			fi
		fi
	done
)
