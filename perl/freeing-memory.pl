#!/usr/bin/env perl

use strict;
use warnings;

use Devel::Peek;
{
    no warnings 'once';
    $Devel::Peek::pv_limit = 20;    # truncate the string in output
}
use Memory::Usage;
my $mu = Memory::Usage->new();

my $buffer;
$mu->record("\$buffer is declared");
print "\$buffer is declared:\n";
Dump $buffer;

$buffer = 'Buster' x 1e6;
$mu->record("\$buffer is huge");
print "\$buffer is huge:\n";
Dump $buffer;

$buffer = '';
$mu->record("\$buffer is set to ''");
print "\$buffer is set to '':\n";
Dump $buffer;

$buffer = undef;
$mu->record("\$buffer is set to undef");
print "\$buffer is set to undef:\n";
Dump $buffer;

#undef $buffer;
#$mu->record("undef \$buffer");
#print "undef \$buffer:\n"; Dump $buffer;

undefit_scalar( \$buffer );
$mu->record("undefit is called with \\\$buffer as arg");
print "undefit is called with \\\$buffer as arg:\n";
Dump $buffer;

$buffer = 'Ginger';
$mu->record("\$buffer is small");
print "\$buffer is small:\n";
Dump $buffer;

$mu->dump();

for ( 7, 6, 5, 4, 3, 2, 1 ) {
    my $count = 10**$_;
    my $intheloop = "$count - " . ( 'busted' x $count );
    $mu->record("\$intheloop for $count");
    print "\$intheloop for $count:\n";
    Dump $intheloop;
    if (1) {
        undef $intheloop;
        $mu->record("\$intheloop after undef");
        print "\$intheloop after undef:\n";
        Dump $intheloop;
    }
}

my $afterloop = 'something small';
print "\$afterloop:\n";
Dump $afterloop;

$mu->record("Before hashref creation");
my $hashref = {
    string => ( 'astr' x 1e5 ),
    array  => [ qw( 1 2 3 4 5 6 7 8), ( 'aref' x 1e5 ) ],
    hash   => {
        a => 1,
        b => 2,
        c => 3,
        d => 4,
        e => 5,
        f => ( 'href' x 1e5 )
    }
};
$mu->record("After hashref creation");
print STDERR "****** \$hasref:\n";
Dump $hashref;

#$hashref = undef;
#$mu->record("After hashref undef");
#print STDERR "\n******\$hasref = undef\n"; Dump $hashref;

#undef $hashref;
#$mu->record("After undef hashref");
#print STDERR "\n******undef \$hasref:\n"; Dump $hashref;

undefit_structure($hashref);
$mu->record("After undefit_structure hashref");
print STDERR "\n******undefit_structure(\$hashref):\n";
Dump $hashref;

sub undefit_structure {
    my ( $tgt, $type ) = @_;
    if ( ref($tgt) eq 'HASH' or ( $type and $type eq 'HASH' ) ) {
        for ( values(%$tgt) ) {
            if ( not ref($_) ) {
                undefit_scalar( \$_ );
            } else {
                undefit_structure($_);
            }
        }
        delete $tgt->{$_} for keys(%$tgt);
    } elsif ( ref($tgt) eq 'ARRAY' or ( $type and $type eq 'ARRAY' ) ) {
        for (@$tgt) {
            if ( not ref($_) ) {
                undefit_scalar( \$_ );
            } else {
                undefit_structure($_);
            }
        }
    }
}

print STDERR "\n";
$mu->dump();

sub undefit_scalar {
    my $tgt = $_[0];
    undef $$tgt;
}
