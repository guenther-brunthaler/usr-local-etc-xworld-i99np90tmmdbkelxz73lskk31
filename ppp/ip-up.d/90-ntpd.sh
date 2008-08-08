#! /bin/false


(
	log() {
		local CATEGORY TOPIC
		CATEGORY=$1; shift
		TOPIC="`readlink -f \"$SCRIPT\"`"
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


	# Wait 20 seconds for the slow connection and start the ntpd service.
	sleep 20
	if test -x /etc/init.d/ntpd; then
		/etc/init.d/ntpd --quiet status || {
			run test -f /etc/conf.d/ntpd
			run . /etc/conf.d/ntpd
			log debug "Starting NTP service daemon"
			run start-stop-daemon --start \
				--exec /usr/sbin/ntpd \
				--pidfile /var/run/ntpd.pid \
				-- -p /var/run/ntpd.pid ${NTPD_OPTS}
		}
	fi
)
