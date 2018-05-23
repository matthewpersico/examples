#!/usr/bin/env perl

use strict;
use warnings;

for my $i (0..$ARGV[0]) {
    print scalar(localtime()), " I am $$ $i\n";
    sleep 1;
}
print "Bye!\n";
exit $ARGV[1];
