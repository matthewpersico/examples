#!/usr/bin/env perl
# andornot.pl
use strict;
use warnings;

for my $foo (undef,1) {
    for my $bar (undef,1) {
        my $f = $foo || 'undef';
        my $b = $bar || 'undef';
        print "*** foo = $f, bar = $b***\n";
        if ( not defined $foo || defined $bar ) {
            print "'if ( not defined $f || defined $b )' evals to true \n";
        } else {
            print "'if ( not defined $f || defined $b )' evals to false \n";
        }
        if ( (not defined $foo) || (defined $bar) ) {
            print "'if ( (not defined $f) || (defined $b) )' evals to true \n";
        } else {
            print "'if ( (not defined $f) || (defined $b) )' evals to false \n";
        }
        print "\n";
        if ( not defined $foo or defined $bar ) {
            print "'if ( not defined $f or defined $b )' evals to true \n";
        } else {
            print "'if ( not defined $f or defined $b )' evals to false \n";
        }
        if ( (not defined $foo) or (defined $bar) ) {
            print "'if ( (not defined $f) or (defined $b) )' evals to true \n";
        } else {
            print "'if ( (not defined $f) or (defined $b) )' evals to false \n";
        }
        print "\n\n";
    }
}
