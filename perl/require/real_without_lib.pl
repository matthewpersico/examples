#!/usr/bin/env perl
use strict;
use warnings;

use RealPackage;

my $iam = 'real_without_lib.pl';

print "** $iam:\@INC=@INC\n";
print "** $iam:\$ENV{PERL5LIB}=$ENV{PERL5LIB}\n\n";

print RealPackage::check();
