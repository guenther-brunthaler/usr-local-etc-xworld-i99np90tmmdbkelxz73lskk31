# Set umasks for the User Private Group (UPG) security model.


case `id -u` in
	0)
		# 077 would be more secure, but 022 is generally quite
		# realistic. This will allow group members to read what root
		# has written in a SGID project-directory owned by the group.
		umask 022
		;;
	*)
		# Users use the UPG ("user private group") security model on
		# this site. This allows other group members full r/w access
		# in a SGID project-directory owned by the group.
		umask 002
esac
