#!/usr/bin/env perl
use strict;
use warnings;
use File::Spec::Functions qw<rel2abs>;

## 1) Put the real location at the head of @INC
use lib 'lib';

## 2) Put the monkeypatching location at the head of @INC so it gets seen
## before the real location.
use lib 'testlib';

my $iam = 'test.pl';

## 3) Build PERL5LIB to reflect our desired state and put it in the environment
## so that it is seen by the system() call.
my $oldp5l = $ENV{PERL5LIB};
$ENV{PERL5LIB} = join(':',
                      map { rel2abs($_) } @INC);
$ENV{PERL5LIB} = join(':',
                      $ENV{PERL5LIB},
                      $oldp5l) if($oldp5l);

print "** $iam:\@INC=@INC\n";
print "** $iam:\$ENV{PERL5LIB}=$ENV{PERL5LIB}\n\n";

## This one will never reflect our monkey-patched version because the
##    use lib 'lib'
## statement puts the real dir before the monkeypactched dir internally. Which
## is why I prefer PERL5LIB to "use lib".
##system("./real_with_lib.pl");

## This one should reflect our monkey-patched version.
system("./real_without_lib.pl");
