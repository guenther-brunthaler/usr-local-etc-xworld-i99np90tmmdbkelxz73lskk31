case $VI in
	1 | 2)
		case $TOKEN in
			ccache) M=1;; # Problems with mixed compiler versions
		esac
		;;
esac
