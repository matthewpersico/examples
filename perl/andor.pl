#!/usr/bin/env perl

use strict;
use warnings;

my %hash = (
    undefed => undef,
    zero => 0,
    one => 1,
    the_old_one => 0E0,
    empty_string => '',
    zero_string => '0',
    one_string => '1',
    the_old_one_string => '0E0');

my @keys = qw (
                  undefed
                  zero
                  one
                  the_old_one
                  empty_string
                  zero_string
                  one_string
                  the_old_one_string );

print "non existant ||: " , $hash{noex1} || 'logical false', "\n";
print "non existant //: " , $hash{noex2} // 'not defined', "\n";

for my $key (@keys) {
    print "$key ||: " , $hash{$key} || 'logical false', "\n";
    print "$key //: " , $hash{$key} // 'not defined', "\n";
}
