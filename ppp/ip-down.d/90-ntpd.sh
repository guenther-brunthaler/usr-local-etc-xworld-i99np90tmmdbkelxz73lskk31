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


	# Stop the ntpd service after the disconnection.
	if test -x /etc/init.d/ntpd; then
		if /etc/init.d/ntpd --quiet status ; then
			run /etc/init.d/ntpd --quiet stop
		else
			log debug "Stopping NTP service daemon"
			run start-stop-daemon --stop \
				--pidfile /var/run/ntpd.pid \
				--exec /usr/sbin/ntpd
		fi
		log notice "Setting CMOS clock" \
			"to least recently updated NTP time"
		run /etc/init.d/hwclock --quiet save
	fi
)
