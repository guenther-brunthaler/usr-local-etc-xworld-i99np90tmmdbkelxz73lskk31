#! /bin/false
# Remove the SCSI CDROM kernal module because of
# interoperatibility problems with the HUAWEI E220 3G modem's
# builtin SCSI CDROM emulation, which will flood the system logs
# with status change error messages.

modprobe -qr sr_mod
