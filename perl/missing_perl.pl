#!/usr/bin/env perl

use strict;
use warnings;

my @perlexes = ('nope', 'nopeagain', $^X);
while (@perlexes) {
    my $perlexe = shift @perlexes;
    my @cmd = ( $perlexe ) ;
    push @cmd, '-e', 'print qw(Hello world)';
    exec( @cmd ) or do {
        # If we are here, the exec failed. It is more likely than
        # not that BPKGMOVE yanked the /bb/yadayadayada fully
        # resolved link to perl out from underneath us. Deal with
        # it.

        # The 'or do {...' shuts up syntax checking that complains
        # about probably unreachable code after the exec.
        #<<< perltidy
        if ( !-e $perlexe ) {
            if (@perlexes) {
                warn( "Exec of $perlexe failed ($!) because it does not exist." .
                        " Probably caused by a BPKGMOVE. Trying $perlexes[0]"
                    );
            } else {
                die "Exec of $perlexe failed ($!) because it does not exist." .
                  " Probably caused by a BPKGMOVE. No more Perl executables to try.\n";
            }
        } else {
            die "Exec failed: $!\n";
        }
        #>>> perltidy
    }
}
