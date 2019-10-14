#! /bin/false
# Adds $HOME hierarchy and custom directories to $LUA_PATH.
#
# If a file ".bashrc_etc/luapaths" exists, the paths
# it contains will be prepended to $LUA_PATH ("#"-comments
# are supported in this file; relative paths will be
# interpreted relative to $HOME).

LUA_PATH=`PERL5LIB= PERLLIB= perl -e '
	$h= $ENV{HOME} or die;
	$h =~ s!/*$!!;
	if (open PERSONAL, "<", "$h/.bashrc_etc/luapaths") {
		@p= map {
			chomp; s!^([^/])!$h/$1!; $_
		} grep /^[^#]/, <PERSONAL>;
		close PERSONAL;
	}
	@p= map "$_/?.lua;$_/?/init.lua", grep -d, @p;
	push @p, ";" if @p;
	print join(";", @p), "\n";
'`
LUA_CPATH=`PERL5LIB= PERLLIB= perl -e '
	$h= $ENV{HOME} or die;
	$h =~ s!/*$!!;
	if (open PERSONAL, "<", "$h/.bashrc_etc/luacpaths") {
		@p= map {
			chomp; s!^([^/])!$h/$1!; $_
		} grep /^[^#]/, <PERSONAL>;
		close PERSONAL;
	}
	@p= map "$_/?.so;$_/loadall.so", grep -d, @p;
	push @p, ";" if @p;
	print join(";", @p), "\n";
'`
export LUA_PATH LUA_CPATH
