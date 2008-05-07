#!/bin/sh

# Stop the ntpd service after the disconnection
if [ -x /etc/init.d/ntpd ]; then
	if /etc/init.d/ntpd --quiet status ; then
		/etc/init.d/ntpd --quiet stop
		/etc/init.d/clock --quiet save
	fi
fi
