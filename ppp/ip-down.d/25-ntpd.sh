#! /bin/false
START_TAG=/var/run/ntpd_autostarted.tag


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
	log debug "25-ntpd.sh executing"
	test ! -e "$START_TAG" && exit
	rm -- "$START_TAG"
	if test -x /etc/init.d/ntpd; then
		if /etc/init.d/ntpd --quiet status ; then
			run /etc/init.d/ntpd --quiet stop
		else
			test ! -e /var/run/ntpd.pid && exit
			log debug "Trying to stop NTP service daemon"
			run start-stop-daemon --stop \
				--pidfile /var/run/ntpd.pid
		fi
		log notice "Setting CMOS clock" \
			"to least recently updated NTP time"
		run /etc/init.d/hwclock --quiet save
	fi
)
