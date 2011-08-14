#! /bin/false

# Block internet access for commercial games run
# as user "gamer".


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


	ipt() {
		run iptables "$@"
	}
	

	IFC=$1
	LOSER="gamer"
	# Erase all rules from the filter table.
	log info "Setting firewall rules"
	ipt -F
	ipt -X
	ipt -N LOGGER
	ipt -A LOGGER -j LOG --log-uid --log-prefix "[IPTFW] " --log-level warning
	ipt -A LOGGER -j REJECT
	ipt -N GAMER
	ipt -A GAMER -m limit --limit 3/minute -j LOGGER
	ipt -A GAMER -j REJECT
	ipt -m owner -A OUTPUT -o "$IFC" --uid-owner "$LOSER" -j GAMER
	ipt -m owner -A OUTPUT -o "$IFC" --uid-owner "et" -j GAMER
) || exit
