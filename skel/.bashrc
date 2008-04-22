# /usr/local/etc/skel/.bashrc:
#
# New user post-initialization hook.


warn() {
	echo "Warning: $1" >&2
}


echo "Running per-user first-time setup..."

# Merge in the distribution-defined skeleton files.
cd /etc/skel
find  -maxdepth 1 -type f | while read F; do
	T="$HOME/$F"
	cp "$F" "$T" || warn "Cannot create '$T'!"
	chmod "--reference=$F" "$T" || {
		warn "Cannot set permissions for '$T'!"
	}
done

T="$HOME/.editor-backups"
mkdir -m 700 "$T" || warn "Cannot create '$T'!"
OLD_IFS="$IFS"
IFS=$'\n'
{
        while read -r L; do
		if [ "${L#-backpath}" != "$L" ]; then
			L="-backpath $T"
		fi
		printf '%s\n' "$L"
        done
} < "$HOME/.joerc" > "$HOME/.joerc.$$"
IFS="$OLD_IFS"
rm "$HOME/.joerc"
mv "$HOME/.joerc.$$" "$HOME/.joerc"

echo "Done."
# Re-run the shell.
cd
ME="$(whoami)"
CMD="$(awk -F':' '$1 == "'$ME'" {print $7}' < /etc/passwd)"
if [ "${0#-}" = "$0" ]; then
	# Not a login shell.
	if [ $- != *i* ]; then
                # Non-interactive.
		exec "$CMD" -- "$@"
        else
                # Interactive.
		exec "$CMD" -i -- "$@"
        fi
else
	# Login shell.
	if [ $- != *i* ]; then
                # Non-interactive.
		exec "$CMD" -l -- "$@"
        else
                # Interactive.
		exec "$CMD" -l -i -- "$@"
        fi
fi
warn "Cannot re-launch shell - trying workaround."
read -p "Press Enter to continue or Ctrl-C to abort. "
. "$HOME/.bashrc"
