#!/bin/sh

# Wait 10 seconds for the slow connection and set the system clock once
sleep 10
if [ -x /usr/sbin/ntpd ]; then
	ntpd -q
elif [ -x /usr/bin/ntpdate ]; then
	ntpdate -s -b -u ntp2.inrim.it 3.it.pool.ntp.org 0.europe.pool.ntp.org
fi
