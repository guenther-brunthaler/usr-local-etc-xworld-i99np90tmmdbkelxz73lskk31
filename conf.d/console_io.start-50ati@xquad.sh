#!/bin/false
# $HeadURL: /caches/xsvn/uxadm/trunk/usr/local/etc/conf.d/console_io.start-50nvdia@xtreme.sh $
# $Author: root $
# $Date: 2006-11-27T12:18:42.839939Z $
# $Revision: 442 $


nvidia_setup_b37g1m74pfcayt03n0na8ms3q() {
	modprobe --quiet nvidia || return 0
	rmmod nvidia
        # udev does not remember the device node the installer created,
        # so we have to recreate them ourselves.
	local i node
        if [ ! -c /dev/.devfsd ]; then
                ebegin "Creating NVIDIA device nodes"
                for i in 0 1 2 3 4 5 6 7; do
                        node="/dev/nvidia$i"
                        rm -f $node
                        mknod $node c 195 $i || error "mknod \"$node\""
                        chmod 0666 $node     || error "chmod \"$node\""
                done
                node="/dev/nvidiactl"
                rm -f $node        
                mknod $node c 195 255    || error "mknod \"$node\""
                chmod 0666 $node         || error "chmod \"$node\""
                eend 0
        fi
}


#nvidia_setup_b37g1m74pfcayt03n0na8ms3q
unset -f nvidia_setup_b37g1m74pfcayt03n0na8ms3q
