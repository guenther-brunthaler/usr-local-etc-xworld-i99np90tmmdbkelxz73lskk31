#!/bin/false
# $HeadURL: /caches/xsvn/uxadm/trunk/usr/local/etc/conf.d/console_io.start-50nvdia@xtreme.sh $
# $Author: root $
# $Date: 2006-11-27T12:18:42.839939Z $
# $Revision: 442 $
#
# Framebuffer console.


alias setup=setup_93camjtdd730g456dzickqgws


setup() {
	local RC I
	ebegin "Switching to userspace VESA framebuffer console"
	modprobe uvesafb; RC=$?
	if test $RC = 0; then
		printf "%s\n" "V:1024x768p-85" > /sys/class/graphics/fb0/mode
		RC=$?
	fi
	test $RC = 0 && modprobe fbcon || RC=$?
	eend $RC
}


#setup
unset -f setup
unalias setup
