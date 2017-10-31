#!/opt/bb/bin/perl

use warnings;
use strict;

print "I am about to call 'below'\n";
below();

sub below {
    print "I am below\n";
}
