#! /bin/false

# Due to pppd documentation, the Huawei E220 modem has a bug requiring
# the "usepeerwins" option.
# However, this will add external WINS servers to smb.conf, which we
# do not want for security reasons.
#
# Therefore, this snippet removes any environment variables
# set up by the "usepeerwins" option. This way the following
# 30-wins.sh script will not detect that "usepeerwins" is enabled.

test -n "$USEPEERWINS" && unset USEPEERWINS WINS1 WINS2
