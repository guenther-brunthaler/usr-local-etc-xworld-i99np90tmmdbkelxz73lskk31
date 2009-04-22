# Whether space-separated string $1 contains token $2.
contains_ncm9q70alywv346gx4ug8hwrq() {
	test x"${1#$2}" != x"$1" && return
	test x"${1%$2}" != x"$1" && return
	test x"${1% $2 *}" != x"$1" && return
	return 1
}
# Check for debugging override.
if contains_ncm9q70alywv346gx4ug8hwrq "$USE" "debug" \
	|| contains_ncm9q70alywv346gx4ug8hwrq "$FEATURES" "noclean"
then
	unset -f contains_ncm9q70alywv346gx4ug8hwrq
	. /etc/portage/env/debugging
else
	unset -f contains_ncm9q70alywv346gx4ug8hwrq
	kpc1zz4q633lsv0zpezddl8u2_core
fi
