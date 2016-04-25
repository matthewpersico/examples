package RealPackage;

## We use this package to shadow ../lib/RealPackage.pm

use strict;
use warnings;

use Data::Dumper;

## 1) We find out where we are.
use FindBin qw($RealBin);
BEGIN { ($RealBin) = ( $RealBin =~ /^(.+)$/ ) }

## 2) We remove ourselves from %INC
my $iam='testlib/RealPackage.pm';
my $delkey = grep { $INC{$_} =~ m|$iam|} keys %INC;
delete $INC{$delkey};

## 3) We load up the real RealPackage.
require "$RealBin/lib/RealPackage.pm";

## 4) We force the re-eval of the function after the reload.
{
    no warnings 'redefine';

    eval q(sub RealPackage::check {
    print("This is check() in $iam\n",
          Data::Dumper->Dump([\%INC], [qw(*INC)]), "\n",
          incis());
    });
}

## We are monkeyu-patched. This is all thwarted if the script in which we use
## RealPackage has a 'use lib' statement that points to the real location; that
## statement will force the real location into @INC before the fake location.
1;
