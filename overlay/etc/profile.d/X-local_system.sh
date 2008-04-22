# Local (on-distribution) system specific customizations.


# This is simply a hook which looks into /usr/local/etc/profile.d
# for local scripts to be executed.

# This is done in order to avoid pulluting the distribution namespace.
# The "X-"-prefix of the name of this script hopefully prevents
# Gentoo from choosing the same names (similar to nonstandard e-mail
# header field names).


for sh in /usr/local/etc/profile.d/*.sh; do
	if [ -r "$sh" ] ; then
		. "$sh"
	fi
done
unset sh
