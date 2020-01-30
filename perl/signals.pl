#!/usr/bin/env perl

use strict;
use warnings;

$SIG{'INT'} = sub {
    print "I got INT(2) and I am outtahere";
    $SIG{'INT'} = 'DEFAULT';
    kill 2, $$
};
$SIG{'TERM'} = sub {
    print "I got TERM(15) and pppttthhhhhhhh!\n"
};
print "I am $$\n";
while (1) {
    sleep 1;
    print scalar(localtime()),qq(\n);
}
