#!/usr/bin/env perl

use strict;
use warnings;

use Getopt::Long;
my %opt = ( doit => 1 );
my $mother;
my $father;
print "1ARGV=@ARGV\n";
GetOptions( \%ENV, 'XXXXF|f=s', 'XXXXM|m=s@', 'XXXXDOIT|doit|do-it!' );
print "2ARGV=@ARGV\n";
GetOptions(
    "mother|s" => \$mother,
    "father"   => \$father
);
print "3ARGV=@ARGV\n";
@opt{qw(added_later_mother added_later_father)} = ( $mother, $father );

use Data::Dumper;
print Data::Dumper->Dump( [ \%opt ], [qw(*opt)] );
print Data::Dumper->Dump( [ \%ENV ], [qw(*ENV)] );
print join( "\n", map { "$_ => $ENV{$_}" } qw( XXXXF XXXXM XXXXDOIT) );
