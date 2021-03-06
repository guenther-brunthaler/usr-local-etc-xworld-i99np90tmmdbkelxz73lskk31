#!/bin/sh

# Handle resolv.conf generation when usepeerdns pppd option is being used.
# Used parameters and environment variables:
# $1 - interface name (e.g. ppp0)
# $USEPEERDNS - set if user specified usepeerdns
# $DNS1 and $DNS2 - DNS servers reported by peer


if [ "$USEPEERDNS" ]; then
	if [ x"$DNS1" = x"10.11.12.13" ]; then
		DNS1=`fgrep resolver1.opendns.com /etc/hosts | cut -f1`
		DNS2=`fgrep resolver2.opendns.com /etc/hosts | cut -f1`
		logger -p daemon.warning -t "`pwd`/$SCRIPT" "Overriding bad DNS address!"
	fi

	if [ -x /sbin/resolvconf ]; then
		{
			echo "# Generated by ppp for $1"
			[ -n "$DNS1" ] && echo "nameserver $DNS1"
			[ -n "$DNS2" ] && echo "nameserver $DNS2"
		} | /sbin/resolvconf -a "$1"
	else
		RESOLVE_CONF=/etc/resolv.dnsmasq
		# add the server supplied DNS entries to $RESOLVE_CONF
		# (taken from debian's 0000usepeerdns)

		# follow any symlink to find the real file
		REALRESOLVCONF=$(readlink -f "$RESOLVE_CONF")
	
		if [ "$REALRESOLVCONF" != "/etc/ppp/resolv.conf" ]; then

			# merge the new nameservers with the other options from the old configuration
			{
				grep --invert-match '^nameserver[[:space:]]' $REALRESOLVCONF
				cat /etc/ppp/resolv.conf
			} > $REALRESOLVCONF.tmp

			# backup the old configuration and install the new one
			cp -dpP $REALRESOLVCONF $REALRESOLVCONF.pppd-backup
			mv $REALRESOLVCONF.tmp $REALRESOLVCONF
	
			# correct permissions
			chmod 0644 $RESOLVE_CONF
			chown root:root $RESOLVE_CONF
		fi
	fi

fi
