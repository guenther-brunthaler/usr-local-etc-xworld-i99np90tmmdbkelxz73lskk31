kpc1zz4q633lsv0zpezddl8u2_filter() {
	local STATE VI NEW TOKEN M SET
	STATE=1; VI=1
	while true; do
		case $STATE in
			1) # Start variable modification.
				# Set old contents as positional parameters.
				case $VI in
					1) set -- $CFLAGS;;
					2) set -- $CXXFLAGS;;
					3) set -- $FEATURES;;
					4) set -- $USE;;
				esac
				SET=
				# Define $SET as overrides corresponding to $VI.
				case $VI in
					kpc1zz4q633lsv0zpezddl8u2_setters
				esac
				NEW=
				STATE=2
				;;
			2) # Modify next token if necessary.
				if test $# -eq 0; then
					STATE=3
					test -n "$SET" && NEW=$NEW${NEW:+ }$SET
					continue
				fi
				TOKEN=$1; shift
				M=
				case $VI in
					1 | 2)
						case $TOKEN in
							-O[0-9]) M=1;;
							-g*) M=1;;
							-DNDEBUG | -DDEBUG | -D_DEBUG) M=1;;
							-fomit-frame-pointer | -fno-omit-frame-pointer) M=1;;
							-fstack-check | -fno-stack-check) M=1;;
							-fno-eliminate-unused-debug-symbols | -feliminate-unused-debug-symbols) M=1;;
						esac
						;;
					3)
						case $TOKEN in
							nostrip | keeptemp | keepwork | noclean) M=1;;
						esac
						;;
					4)
						case $TOKEN in
							debug) M=1;;
						esac
						;;
				esac
				kpc1zz4q633lsv0zpezddl8u2_unsetters
				if test -n "$M"; then
					# $TOKEN matches a debugging-relevant token.
					test -z "$SET" && continue
					TOKEN=$SET; SET=
				fi
				NEW=$NEW${NEW:+ }$TOKEN
				;;
			3) # Complete variable modification.
				case $VI in
					1) CFLAGS=$NEW; VI=2;;
					2) CXXFLAGS=$NEW; VI=3;;
					3) FEATURES=$NEW; VI=4;;
					4) USE=$NEW; return;;
				esac
				STATE=1
				;;
		esac
	done
}
kpc1zz4q633lsv0zpezddl8u2_reconfig
kpc1zz4q633lsv0zpezddl8u2_filter
unset -f kpc1zz4q633lsv0zpezddl8u2_filter
echo "OVERRIDING FLAGS: kpc1zz4q633lsv0zpezddl8u2_title"
if test -n "$PORTAGE_ENV_OVERRIDE_DEBUGGING"; then
	echo "CFLAGS=$CFLAGS"
	echo "CXXFLAGS=$CXXFLAGS"
	echo "FEATURES=$FEATURES"
	echo "USE=$USE"
fi
