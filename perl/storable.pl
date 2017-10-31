#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Storable qw(nstore_fd fd_retrieve);

my %outdata = (
    ahashref => {
        ascalar => 6,
        anarrayref => [ qw( foo bar 7) ],
    }
      ,
    anarrayref => [ { ascalar=>42},
                    [
                        'array[0]',
                        'array[1]'
                    ]
                ]
);
my $indata;
my $fhopen;
my $fdopen;

$indata = undef;
open $fhopen, '>', 'storable.data.fhopen'
  or die "Cannot open storable.data.fhopen:$!";
eval {
    nstore_fd(\%outdata, $fhopen);
};
print $@ if $@;
close $fhopen;

open $fhopen, '<', 'storable.data.fhopen'
  or die "Cannot open storable.data.fhopen:$!";
eval {
    $indata = fd_retrieve($fhopen);
};
print $@ if $@;
close $fhopen;

is_deeply($indata, \%outdata, 'read in eq written out, fh');

done_testing();
