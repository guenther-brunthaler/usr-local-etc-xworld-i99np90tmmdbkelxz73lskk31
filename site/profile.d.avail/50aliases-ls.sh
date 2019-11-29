#! /bin/false
# Version 2019.333

case $- in
	*i*) ;;
	*) return
esac

have_ls_dh9krm7ei6qhi97c04km7upc0=${ls+yes}
ls_dh9krm7ei6qhi97c04km7upc0=$ls
ls='ls --color=auto'
$ls -d / > /dev/null 2>& 1 || ls=ls

case $ls in
	ls) ;;
	*) alias ls="$ls"
esac
alias la="$ls -A"

case `id -u` in
0)
	alias ll="$ls -l"
	alias lla="$ls -l -A"
	;;
*)
	alias ll="$ls -go"
	alias lla="$ls -go -A"
esac
command -v ls-sizes > /dev/null 2>& 1 && alias lss=ls-sizes

case $have_ls_dh9krm7ei6qhi97c04km7upc0 in
	'') unset ls;;
	*) ls=$ls_dh9krm7ei6qhi97c04km7upc0
esac
unset ls_dh9krm7ei6qhi97c04km7upc0 have_ls_dh9krm7ei6qhi97c04km7upc0
