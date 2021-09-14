#!/usr/bin/env perl

use strict;
use warnings;

use Getopt::Long;
my %opt = (doit => 1);
GetOptions( \%opt, 'f=s', 'm=s@', 'doit|do-it!');

use Data::Dumper;

print Data::Dumper->Dump( [ \%opt ], [qw(*opt)] );
