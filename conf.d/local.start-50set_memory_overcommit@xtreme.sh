#!/bin/false
# $HeadURL: /caches/xsvn/uxadm/trunk/usr/local/etc/conf.d/local.start-50set_memory_overcommit@xtreme.sh $
# $Author: root $
# $Date: 2006-12-01T23:48:36.772285Z $
# $Revision: 470 $


# Disables memory overcommitment:
# No more memory can be allocated than there is actually
# memory available in RAM plus swap space.
#
# This makes service daemons like PostgreSQL run
# more reliable, because the memory they have already
# allocated will actually be *there* when they access it.
sysctl -q -w vm.overcommit_memory=2
