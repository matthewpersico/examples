#!/usr/bin/env perl

use strict;
use warnings;

my $file = undef;
if( !-e $file ) {
    print "! -e of an undef value at line ", __LINE__,"-1\n";
}

$file = '';
if( !-e $file ) {
    print "! -e of a blank value line ", __LINE__,  "-1\n";
}
