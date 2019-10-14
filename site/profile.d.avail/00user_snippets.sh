#! /bin/false
# Source all the shell snippets for the "site-snippets" framework for the
# current user. Either source this from your ~/.profile or copy the code
# there.
#
# Version 2019.287

for sh in ~/.profile.d/*.sh
do
	. "$sh"
done
unset sh
