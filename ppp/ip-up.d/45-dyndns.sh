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


	PATH=/usr/sbin:${PATH}
	IP=$4
	## update the DNS server unless the IP address is a private address
	## that may be used as an internal LAN address (or PPtP tunnel).
	case "$IP" in
	10.*)		;;
	172.1[6-9].* | 172.2[0-9].* | 172.3[0-1].*)	;;
	192.168.*)	;;
	"")		log warning "No local IP given so cannot update"
			;;
	*)		(
				sleep 5
				ddclient -daemon=0 -syslog -use=if -if=$1 \
					> /dev/null 2>& 1
			) &
			;;
	esac
)
