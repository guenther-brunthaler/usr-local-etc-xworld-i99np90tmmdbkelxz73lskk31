#! /bin/false
# Adds $HOME hierarchy and custom directories to $PYTHONPATH.
# This assumes modules from CPAN have been installed by
# $ perl Makefile.PL PREFIX=~; make install
#
# If a file ".bashrc_etc/pythonpaths" exists, the paths
# it contains will be prepended to $PYTHONPATH ("#"-comments
# are supported in this file; relative paths will be
# interpreted relative to $HOME).

PYTHONPATH=`PERL5LIB= PERLLIB= perl -e '
	$h= $ENV{HOME} or die;
	$h =~ s!/*$!!;
	if (open PERSONAL, "<", "$h/.bashrc_etc/pythonpaths") {
		@p= map {
			chomp; s!^([^/])!$h/$1!; $_
		} grep /^[^#]/, <PERSONAL>;
		close PERSONAL;
	}
	print join(":", grep -d, @p), "\n";
'`
export PYTHONPATH
