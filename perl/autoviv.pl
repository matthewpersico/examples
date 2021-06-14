#!/usr/bin/env perl

use strict;
use warnings;
use Data::Dumper;

my %h;

$h{foo}->[14]->{bar}->{idontcaraehowdeepyougo}->[8] += 43;

print(Data::Dumper->Dump([\%h],[qw(*h)]));
