#! /bin/false


(
	log() {
		local CATEGORY TOPIC
		CATEGORY=$1; shift
		TOPIC="`pwd`/$SCRIPT"
		logger -p daemon.$CATEGORY -t "$TOPIC" "$*"
	}


	die() {
		log err "$*"
		false; exit
	}


	run() {
		"$@" && return
		die "Could not execute >>>$*<<<, return code ${?}"
	}


	# Wait 10 seconds for the slow connection to be established.
	sleep 10
	SERVERS="ntp2.inrim.it 3.it.pool.ntp.org 0.europe.pool.ntp.org"
	if
		exe=`
			export PATH=$PATH:/usr/local/sbin:/usr/local/bin
			PATH=$PATH:/usr/sbin:/usr/bin:/sbin:/bin
			which sntp 2> /dev/null
		`
		test -n "$exe" && test -x "$exe"
	then
		. /etc/conf.d/sntp
		run "$exe" $SNTP_OPTS
	elif test -x /usr/sbin/ntpd
	then
		run ntpd -q
	elif test -x /usr/bin/ntpdate
	then
		run ntpdate -s -b -u $SERVERS
	fi
	log notice "Setting CMOS clock to obtained NTP time"
	run /etc/init.d/hwclock --quiet save
) || exit
