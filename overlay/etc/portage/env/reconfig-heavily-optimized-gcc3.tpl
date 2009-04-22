eval "`
	gcc-config -E \` \
		gcc-config -l | grep -- $CHOST-'3\.' \
		| head -n 1 | cut -d" " -f3 \
	\`
`"
