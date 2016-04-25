package RealPackage;

use strict;
use warnings;

my $iam='lib/RealPackage.pm';

sub check {
    print "This is check() in $iam\n";
    print incis();
}

sub other {
    print "This is other() in $iam\n";
}

sub incis {
    print "*** $iam:\@INC=@INC\n";
    print "*** $iam:\$ENV{PERL5LIB}=$ENV{PERL5LIB}\n\n";
}

1;
