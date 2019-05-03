#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;

my @myarray;
our @ourarray;

my $config_file = "./test_data_load.config";
eval { do $config_file
      or die "Non-zero return from $config_file"; };
die $@ if $@;

print "Data loaded via 'do':\n",
  Data::Dumper->Dump( [ \@myarray, \@ourarray ], [qw(*myarray *ourarray)] );

open( IH, '<', $config_file ) or die "Cannot open $config_file to read\n";
my $string = join( '', <IH> );
close IH;

my $dummy = eval { $string };
die $@ if $@;

print "Data loaded via string eval:\n",
  Data::Dumper->Dump( [ \@myarray, \@ourarray ], [qw(*myarray *ourarray)] );

$config_file = "./test_data_load2.config";
my $myarrayref =
  eval { do $config_file or die "Non-zero return from $config_file"; };
die $@ if $@;
@myarray = @{$myarrayref};

print "Data loaded via eval assign:\n",
  Data::Dumper->Dump( [ \@myarray, \@ourarray ], [qw(*myarray *ourarray)] );

$Data::Dumper::Terse = 1;
print "Attempt to replicate $config_file output:\n",
  Data::Dumper->Dump( [ \@myarray ] );

## Loading via string eval does not work
