#!/bin/bash
# $Header: /usr/local/etc/rc/RCS/runlevels.sh,v 1.2 2005/08/13 11:32:00 root Exp root $

# Common functions
[[ ${RC_GOT_FUNCTIONS} != "yes" ]] && source /sbin/functions.sh

einfo "Runlevels now: $(/usr/local/bin/runlevels -s)"
