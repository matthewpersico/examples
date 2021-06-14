#!/usr/bin/env perl

use strict;
use warnings;

my %hash = ( a => 0,
             b => 10,
             c => 20,
             d => 30,
             e => 40,
             f => 50,
             g => 60
         );

my @hash_slice = @hash{qw ( a c e g)};
print(qq(hash slice = @hash_slice\n));

my $hash_ref = \%hash;
my @hash_ref_slice = @{$hash_ref}{qw ( b d f)};
print(qq(hash ref slice = @hash_ref_slice\n));
