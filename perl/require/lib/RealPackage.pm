package RealPackage;

use strict;
use warnings;

use Data::Dumper;

my $iam='lib/RealPackage.pm';

sub check {
    print("This is check() in $iam\n",
          Data::Dumper->Dump([\%INC], [qw(*INC)]), "\n");
    incis();
    return 0;
}

sub other {
    print "This is other() in $iam\n";
    return 0;
}

sub incis {
    print "*** $iam:\@INC=@INC\n";
    print "*** $iam:\$ENV{PERL5LIB}=$ENV{PERL5LIB}\n\n";
    return 0;
}

5;
