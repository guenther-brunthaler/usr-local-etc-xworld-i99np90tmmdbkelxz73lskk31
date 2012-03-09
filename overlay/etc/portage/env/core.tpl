kpc1zz4q633lsv0zpezddl8u2_filter() {
	local STATE V NEW TOKEN M SET
	STATE=NEXTVAR; V=
	while true
	do
		case $STATE in
			NEXTVAR) # Start variable modification.
				# Proceed to next variable.
				case $V in
					"") V=CFLAGS;;
					CFLAGS) V=CXXFLAGS;;
					CXXFLAGS) V=CPPFLAGS;;
					CPPFLAGS) V=LDFLAGS;;
					LDFLAGS) V=FEATURES;;
					FEATURES) V=USE;;
					USE) return
				esac
				# Set old contents as positional parameters.
				eval "set -- \$$V"
				SET=
				# Define $SET as overrides corresponding to $V.
				case $V in
					kpc1zz4q633lsv0zpezddl8u2_setters
				esac
				NEW=
				STATE=MDFVAR
				;;
			MDFVAR) # Modify next token if necessary.
				if test $# -eq 0
				then
					STATE=FINVAR
					test -n "$SET" && NEW=$NEW${NEW:+ }$SET
					continue
				fi
				TOKEN=$1; shift
				M=
				case $V in
					CFLAGS | CXXFLAGS)
						case $TOKEN in
							-O[0-9]) M=1;;
							-g*) M=1;;
							-DNDEBUG | -DDEBUG | -D_DEBUG) M=1;;
							-fomit-frame-pointer | -fno-omit-frame-pointer) M=1;;
							-fstack-check | -fno-stack-check) M=1;;
							-fno-eliminate-unused-debug-symbols | -feliminate-unused-debug-symbols) M=1;;
						esac
						;;
					CPPFLAGS)
						case $TOKEN in
							-DNDEBUG | -DDEBUG | -D_DEBUG) M=1;;
						esac
						;;
					FEATURES)
						case $TOKEN in
							nostrip | keeptemp | keepwork | noclean) M=1;;
						esac
						;;
					USE)
						case $TOKEN in
							debug) M=1;;
						esac
						;;
				esac
				kpc1zz4q633lsv0zpezddl8u2_unsetters
				if test -n "$M"
				then
					# $TOKEN matches a debugging-relevant token.
					test -z "$SET" && continue
					TOKEN=$SET; SET=
				fi
				NEW=$NEW${NEW:+ }$TOKEN
				;;
			FINVAR) # Complete variable modification.
				if test -n "$PORTAGE_ENV_OVERRIDE_DEBUGGING"
				then
					eval "echo \"$V=\\\"\$NEW\\\"\" >& 2"
				fi
				if eval "test -n \"\${$V+x}\""
				then
					# Variable already existed before.
					eval "$V=\$NEW"
				else
					# Non-existing variable.
					if test -n "$NEW"
					then
						eval "$V=\$NEW"
						eval "export $V"
					fi
				fi
				STATE=NEXTVAR
				;;
		esac
	done
}
kpc1zz4q633lsv0zpezddl8u2_reconfig
echo "OVERRIDING FLAGS: kpc1zz4q633lsv0zpezddl8u2_title" >& 2
kpc1zz4q633lsv0zpezddl8u2_filter
unset -f kpc1zz4q633lsv0zpezddl8u2_filter
