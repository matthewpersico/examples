#!/usr/bin/env perl

## NONE OF THIS WORKS

use strict;
use warnings;

my $name;
my $re = qr(xyz($name)ab);

$name = 'ooga';

my $line = qq(xyznopeab);
if ( $line =~ m|$re| ) {
    print "'$line' matched $re\n";
}

$line = qq(xyz${name}ab);
if ( $line =~ m|$re| ) {
    print "'$line' matched $re\n";
}
