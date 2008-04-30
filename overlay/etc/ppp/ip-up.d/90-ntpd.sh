#!/bin/sh

# Wait 20 seconds for the slow connection and start the ntpd service
sleep 20
if [ -x /etc/init.d/ntpd ]; then
	if ! /etc/init.d/ntpd --quiet status ; then
		/etc/init.d/ntpd --quiet start
	fi
fi
