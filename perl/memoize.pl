#!/usr/bin/env perl

use 5.16.0;
use Memoize;

sub bad_candidate {
    my ($arg) = @_;

    if ( $arg->[-1] == 15 ) {
        $arg->[0] = 30;
    }

    return $arg;
}

memoize( "bad_candidate", INSTALL => "memoized_bad_candidate" );

my @arr = ( 1, 17, 4 );

my $result;

$result = memoized_bad_candidate( \@arr );
say "result = $result, values = @{$result}";
$arr[-1] = 15;
$result = memoized_bad_candidate( \@arr );
say "result = $result, values = @{$result}";
$result = bad_candidate( \@arr );
say "result = $result, values = @{$result}";
