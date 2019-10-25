#! /bin/sh
# Set up $XDG_RUNTIME_DIR (unless already set).

# Version 2019.255
# Copyright (c) 2019 Guenther Brunthaler. All rights reserved.
#
# This script is free software.
# Distribution is permitted under the terms of the GPLv3.

test "$XDG_RUNTIME_DIR" || {
	XDG_RUNTIME_DIR=${XDG_DATA_HOME:-"$HOME"/.local/share}
	mkdir -p -- "$XDG_RUNTIME_DIR"
	XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR/`
			:
		`xdg_runtime_dir-ngjjaq42wb5238hup1bmwjtpp.d
	test -L "$XDG_RUNTIME_DIR" && test -d "$XDG_RUNTIME_DIR" || (
		set -e
		if test -L "$XDG_RUNTIME_DIR" || test -e "$XDG_RUNTIME_DIR"
		then
			rm -- "$XDG_RUNTIME_DIR"
		fi
		u=`id -u`
		u=`mktemp -d -- "${TMPDIR:-/tmp}/run-$u.XXXXXXXXXX"`
		ln -s -- "$u" "$XDG_RUNTIME_DIR"
	) \
	&& XDG_RUNTIME_DIR=`readlink -- "$XDG_RUNTIME_DIR"` \
	&& export XDG_RUNTIME_DIR \
	&& test -d "$XDG_RUNTIME_DIR" && test -w "$XDG_RUNTIME_DIR" \
	|| unset XDG_RUNTIME_DIR
}
