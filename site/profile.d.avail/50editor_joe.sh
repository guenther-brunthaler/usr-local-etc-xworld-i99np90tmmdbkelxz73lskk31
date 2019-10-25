# Overrides the system default editor with "joe".
#
# If you *really* prefer nano, comment out the lines below.
# But then again, who does?
#
# Version 2019.298
# Copyright (c) 2019 Guenther Brunthaler. All rights reserved.
#
# This script is free software.
# Distribution is permitted under the terms of the GPLv3.

if test -f /usr/bin/joe
then
	EDITOR=/usr/bin/joe
fi

VISUAL=$EDITOR
export EDITOR VISUAL
