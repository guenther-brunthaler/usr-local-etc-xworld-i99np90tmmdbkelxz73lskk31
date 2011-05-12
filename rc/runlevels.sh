#! /bin/bash

# Common functions
test -z "$RC_GOT_FUNCTIONS" \
	&& . /usr/local/libexec/xworld/sh/gentoo-functions.sh

einfo "Runlevels now: $(/usr/local/bin/runlevels -s)"
