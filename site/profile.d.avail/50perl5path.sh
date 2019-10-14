#! /bin/false
# Adds $HOME hierarchy and custom directories to $PERL5PATH.
# This assumes modules from CPAN have been installed by
# $ perl Makefile.PL PREFIX=~; make install
#
# If a file ".bashrc_etc/perl5paths" exists, the paths
# it contains will be prepended to $PERL5PATH ("#"-comments
# are supported in this file; relative paths will be
# interpreted relative to $HOME).

PERL5LIB=`PERL5LIB= PERLLIB= perl -e '
	$h= $ENV{HOME} or die;
	$h =~ s!/*$!!;
	if (open PERSONAL, "<", "$h/.bashrc_etc/perl5paths") {
		@p= map {
			chomp; s!^([^/])!$h/$1!; $_
		} grep /^[^#]/, <PERSONAL>;
		close PERSONAL;
	}
	foreach (@INC) {
		next unless m!^/!;
		s!^/usr/!/!;
		substr($_, 0, 0)= $h;
		push @p, $_;
	}
	print join(":", grep -d, @p), "\n";
'`
export PERL5LIB
