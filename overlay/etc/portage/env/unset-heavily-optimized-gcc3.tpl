case $V in
	FEATURES)
		case $TOKEN in
			ccache) M=1;; # Problems with mixed compiler versions
		esac
		;;
	USE)
		case $TOKEN | -$TOKEN | +$TOKEN) in
			ccache) M=1;; # Problems with mixed compiler versions
		esac
		;;
esac
