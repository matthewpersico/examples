#!/usr/bin/env perl

use strict;
use warnings;

use Getopt::Long;
my %opt;
GetOptions( \%opt, 'f=s', );

use Data::Dumper;

print Data::Dumper->Dump( [ \%opt ], [qw(*opt)] );
