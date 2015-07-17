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



	if test -x /etc/init.d/ntpd
	then
		/etc/init.d/ntpd --quiet status \
		|| { /etc/init.d/ntpd --quiet start; > "$START_TAG"; } \
		|| {
			run test -f /etc/conf.d/ntpd
			run . /etc/conf.d/ntpd
			log debug "Trying to start NTP service daemon"
			run start-stop-daemon --start \
				--exec /usr/sbin/ntpd \
				--pidfile /var/run/ntpd.pid \
				-- -p /var/run/ntpd.pid ${NTPD_OPTS}
			> "$START_TAG"
		}
	fi
) || exit
