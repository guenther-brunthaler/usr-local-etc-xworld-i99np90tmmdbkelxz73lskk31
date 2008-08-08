#! /bin/false


alias setup=setup_93camjtdd730g456dzickqgws


setup() {
	local RC I
	ebegin "Switching to userspace VESA" \
		"framebuffer console"
	modprobe uvesafb && modprobe fbcon; RC=$?
	if test $RC = 0; then
		printf "%s\n" "V:1024x768p-60" \
			> /sys/class/graphics/fb0/mode
		RC=$?
	fi
	test $RC = 0 && modprobe fbcon || RC=$?
	if test x"$RC" = x"0"; then
		/etc/init.d/consolefont --quiet status || {
			/etc/init.d/consolefont --quiet start
		}
		if /etc/init.d/gpm --quiet status; then
			/etc/init.d/gpm --quiet restart
		fi
	fi
	eend $RC
}


#setup
unset -f setup
unalias setup
