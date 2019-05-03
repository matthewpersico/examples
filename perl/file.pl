#!/usr/bin/env perl

use strict;
use warnings;

my $file = undef;
if ( !-e $file ) {
    print "! -e of an undef value at line ", __LINE__, "-1\n";
}

$file = '';
if ( !-e $file ) {
    print "! -e of a blank value line ", __LINE__, "-1\n";
}

open my $log_fh, '<', $0;

$log_fh->seek( 64, 0 );
print "\n-- 64 --\n", join( "", <$log_fh> );

$log_fh->seek( 106, 0 );
print "\n-- 106 --\n", join( "", <$log_fh> );

$log_fh->seek( 64, 0 );
print "\n-- 64 --\n", join( "", <$log_fh> );

$log_fh->seek( 8, 0 );
print "\n-- 8 --\n", join( "", <$log_fh> );

$log_fh->seek( 1492, 0 );
print "\n-- 1492 --\n", join( "", <$log_fh> );

$log_fh->seek( 0, 0 );
print "\n-- 0 --\n", join( "", <$log_fh> );

$log_fh->close;

exit;
