# Launch gnupg-agent if necessary and set environment variables.

while :
do
	if test ! -f "${HOME}"/.gpg-agent-info
	then
		gpg-agent --daemon --enable-ssh-support \
			--write-env-file "${HOME}/.gpg-agent-info"
	fi
	GPG_AGENT_INFO=
	. "$HOME"/.gpg-agent-info
	if test -z "$GPG_AGENT_INFO"
	then
		unset GPG_AGENT_INFO SSH_AUTH_SOCK SSH_AGENT_PID GPG_TTY
		case $- in
			*i*)
				echo "WARNING: Could not start" \
					"gnupg-agent!" >& 2
				;;
		esac
		break
	fi
	if netstat -Aunix -an | fgrep -q " ${GPG_AGENT_INFO%%:*}"
	then
		GPG_TTY=`tty`
		export GPG_AGENT_INFO SSH_AUTH_SOCK SSH_AGENT_PID GPG_TTY
		break
	fi
	rm "${HOME}/.gpg-agent-info"
done
