#!/usr/bin/env perl
use strict;
use warnings;

use FindBin qw($RealBin);
BEGIN { ($::RealBin) = ( $::RealBin =~ /^(.+)$/ ) }
use lib "$::RealBin/lib";

use RealPackage;

my $iam = 'real_with_lib.pl';

print "** $iam:\@INC=@INC\n";
print "** $iam:\$ENV{PERL5LIB}=$ENV{PERL5LIB}\n\n";

print RealPackage::check();
