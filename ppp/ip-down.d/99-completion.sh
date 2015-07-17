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
	

	log info "PPP link $1 on $2 has been brought down"
	rm "/var/run/ppp-$1.established"
) || exit
