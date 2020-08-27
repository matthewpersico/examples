#!/usr/bin/env perl

use strict;
use warnings;
use Sys::Hostname;
use Data::Dumper;

use feature 'state';

sub thefunc1 {
    state %args;
    if ( not %args ) {
        %args = @_;
    } else {
        my ( $k, $v );
        ## Cannot  while (($k,$v) = each %{(@x)} ) {
        my %newargs = @_;
        while ( ( $k, $v ) = each %newargs ) {
            $args{$k} = $v;
        }
    }
    print Data::Dumper->Dump( [ \%args ], [qw(*args)] );
}

thefunc1( f => 'thefunc1', type => 'start', host   => hostname() );
thefunc1( f => 'thefunc1', type => 'end',   status => 'success' );
