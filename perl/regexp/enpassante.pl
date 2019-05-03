#!/usr/bin/env perl

use strict;
use warnings;

( my $x = 'qbcdefg' ) =~ s/cde//;

print $x;

## Can't do this:  ((my $y = 'qbcdefg') =~ s/cde//) =~ s/g//;
