#!/usr/bin/env perl

use strict;
use warnings;


sub subcopy {
    my $arg1 = $_[0];
    print "arg1 = $arg1->{a}\n";
    $arg1->{a} = 42;
    print "arg1 = $arg1->{a}\n";
}

sub direct {
    print "arg1 = $_[0]->{a}\n";
    $_[0]->{a} = 42;
    print "arg1 = $_[0]->{a}\n";
}


my $foo = { a => 6 };

print "foo = $foo->{a}\n";

subcopy ($foo);

print "foo = $foo->{a}\n";

direct ($foo);

print "foo = $foo->{a}\n";
