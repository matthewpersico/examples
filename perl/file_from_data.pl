#!/usr/bin/env perl

use strict;
use warnings;

if ( $ARGV[0] eq 'seek' ) {
    my $log_fh = \*main::DATA;
    my $whence = $log_fh->tell();
    $log_fh->seek( $whence + 64, 0 );
    print "\n-- 64 --\n", join( "", <$log_fh> );

    $log_fh->seek( $whence + 106, 0 );
    print "\n-- 106 --\n", join( "", <$log_fh> );

    $log_fh->seek( $whence + 64, 0 );
    print "\n-- 64 --\n", join( "", <$log_fh> );

    $log_fh->seek( $whence + 8, 0 );
    print "\n-- 8 --\n", join( "", <$log_fh> );

    $log_fh->seek( $whence + 1492, 0 );
    print "\n-- 1492 --\n", join( "", <$log_fh> );

} else {
    while (<DATA>) {
        print $_;
    }
}

exit;

__DATA__
01234567890123456789
1234567890123456789
1234567890123456789
12
X <- That X is the 64th char in
this file.
Y <- That Y is the 106th char in this file.
junk
more junk.
bye!
