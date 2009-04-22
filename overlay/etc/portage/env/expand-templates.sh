#! /bin/sh
# Written in 2009 by Guenther Brunthaler.


UUID="kpc1zz4q633lsv0zpezddl8u2" # Base-35 encoded UUID.


die() {
	echo "ERROR: $*" >& 2
	false; exit
}


run() {
	"$@" && return
	die "Command >>>$*<<< failed, return code ${?}!"
}


system() {
	REPLY=`run "$@"` || exit
}


# Safe "echo".
wline() {
	run printf '%s\n' "$*"
}


# Print command embedded into $1, or an empty string if no command.
extract_command() {
	wline "$1" | run sed -e 's/.*'$UUID'_\([a-z][-_a-z0-9]*\).*/\1/;t;d'
}


# Print line $1 replacing command sequence $2 by string $3.
print_replacement() {
	wline "$1" | run sed -e 's/'$UUID'_'$2'/'"$3"'/g'
}


# Print indentation for command $2 in line $1.
print_indent() {
	wline "$1" | run sed -e 's/\(.*\)'$UUID'_'$2'.*/\1/;t;d'
}


# Expand line $1 with respect to command $2.
expand_command() {
	case $2 in
		title) print_replacement "$1" "$2" "$TITLE";;
		filter) print_replacement "$1" "$2" "$FILTER";;
		*)
			system print_indent "$1" "$2"
			case $2 in
				setters) expand "$SETTER" "$REPLY";;
				unsetters) expand "$UNSETTER" "$REPLY" true;;
				reconfig) expand "$RECONFIG" "$REPLY" true;;
				*) expand "$2.tpl" "$REPLY";;
			esac
			;;
	esac
}


# Expand file $1 with indent $2.
# If $3 exists, just do nothing if $1 does not exist.
# Otherwise, $1 must exist.
expand() {
	(
		if test ! -f "$1"; then
			test -n "$3" && exit
			die "File '$1' not found!"
		fi
		exec < "$1"
		while IFS= read -r LINE; do
			LINE=$2$LINE
			system extract_command "$LINE"
			if test -n "$REPLY"; then
				expand_command "$LINE" "$REPLY"
			else
				wline "$LINE"
			fi
		done
	) || exit
}


entitle() {
	wline "$1" | run tr '_-' ' '
}


for SETTER in set-*.tpl; do
	UNSETTER=un$SETTER
	BASE=${SETTER#*-}
	TITLE=title-$BASE
	RECONFIG=reconfig-$BASE
	INPUT=expansion
	if test x"$BASE" = x"${BASE#debug}"; then
		INPUT=debugging-$INPUT
		FILTER=optimizer

	else
		FILTER=debugging
	fi
	FILTER="${FILTER}_filter_ncm9q70alywv346gx4ug8hwrq"
	BASE=${BASE%.tpl}
	OUTPUT=$BASE
	if test -f "$TITLE"; then
		REPLY=
		IFS= read < "$TITLE"
		test -z "$REPLY" && die "Empty title file '$TITLE'!"
		TITLE=$REPLY
	else
		system entitle "$BASE"; TITLE=$REPLY
	fi
	run echo "Generating file \"$OUTPUT\": $TITLE..." >& 2
	expand "$INPUT.tpl" > "$OUTPUT"
done
