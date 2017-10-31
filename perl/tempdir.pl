#! /opt/bb/bin/perl
use strict;
use warnings;

use Cwd;
use File::Temp qw<tempdir>;

my $t = tempdir( CLEANUP => 1 );
my $original_dir;

open (OH, '>tempdir.dat');
print OH $t;
close OH;

print 'tempdir is ', $t, qq(\n), qx(ls -ld $t);

if ($ARGV[0] eq 'gothere') {
    $original_dir=getcwd();
    chdir $t;
}
if ($ARGV[1] eq 'die') {
    die 'Dying with cwd of ', getcwd() , qq(\n);
} else {
    print 'Exiting with cwd of ', getcwd(), ', value of ', $ARGV[1], qq(\n);
    exit $ARGV[1];
}

END {
    if ($ARGV[2] eq 'END' and $original_dir) {
        chdir $original_dir;
    }
}
