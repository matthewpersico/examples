#!/usr/bin/env perl

use strict;
use warnings;

use Getopt::Long;
my %opt = (
    doit => 1,
    diff => 0
);
my $mother;
my $father;
print "1ARGV=@ARGV\n";
GetOptions( \%opt, 'f=s', 'm=s@', 'doit|do-it!', 'diff:s' );
print "2ARGV=@ARGV\n";
GetOptions(
    "mother|s" => \$mother,
    "father"   => \$father
);
print "3ARGV=@ARGV\n";
@opt{qw(added_later_mother added_later_father)} = ( $mother, $father );

use Data::Dumper;
print Data::Dumper->Dump( [ \%opt ], [qw(*opt)] );
