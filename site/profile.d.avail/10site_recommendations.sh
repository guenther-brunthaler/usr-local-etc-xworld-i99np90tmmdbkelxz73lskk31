#! /bin/false
# Source all the shell snippets recommended by the local site's administrator
# for the current user. Those snippets are a subset (and just symlinks to)
# those which can be found in ~/.profile.d/site/profile.d.avail/. If you do
# not want the administrator's chosen whole selection, symlink the individual
# snippets from ~/.profile.d/site/profile.d.avail/ into your ~/.profile.d
# directly instead.
#
# Version 2019.287

for sh in ~/.profile.d/site/profile.d.recommended/*.sh
do
	. "$sh"
done
unset sh
