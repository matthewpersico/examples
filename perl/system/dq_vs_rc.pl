#!/usr/bin/env perl

use strict;
use warnings;
use Data::Dumper;

exit 42;

END {
    my $ev = $?;
    my $src = system("@ARGV");
    my $sev = $?;
    my %src = (
        signal => $src & 127,
        core   => ($src & 128) ? 1 : 0,
    );
    my %sev = (
        signal => $sev & 127,
        core   => ($sev & 128) ? 1 : 0,
    );
    $src{exit} = $src{signal} ? 'N/A' : $src >> 8;
    $sev{exit} = $sev{signal} ? 'N/A' : $sev >> 8;
    print "\$ev = $ev, \$src = $src, \$sev = $sev\n";
    print Data::Dumper->Dump([\%src,\%sev],[qw(*src *sev)]);
}
