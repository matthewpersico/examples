#!/use/bin/env perl

use strict;
use warnings;
my ($pid, $line, $priorfh);

pipe(FROM_PARENT, TO_CHILD)     or die "pipe: $!";
pipe(FROM_CHILD,  TO_PARENT)    or die "pipe: $!";
$priorfh = select(TO_CHILD) ; $| = 1; select($priorfh);  # autoflush
$priorfh = select(TO_PARENT); $| = 1; select($priorfh);  # autoflush

if ($pid = fork) {
    close FROM_PARENT; close TO_PARENT;
    print TO_CHILD "Parent Pid $$ is sending this\n";
    chomp($line = <FROM_CHILD>);
    print "Parent Pid $$ just read this: '$line'\n";
    close FROM_CHILD; close TO_CHILD;
    waitpid($pid,0);
} else {
    die "cannot fork: $!" unless defined $pid;
    close FROM_CHILD; close TO_CHILD;
    chomp($line = <FROM_PARENT>);
    print "Child Pid $$ just read this: '$line'\n";
    print TO_PARENT "Child Pid $$ is sending this\n";
    close FROM_PARENT; close TO_PARENT;
    exit;
}

## pipes are directional - lefthand is the read, righthand is the write and the
## perspective is from the reader. This code, with the reversed usage, fails:

=for backwards, fails

$priorfh = select(TO_CHILD) ; $| = 1; select($priorfh);  # autoflush
$priorfh = select(TO_PARENT); $| = 1; select($priorfh);  # autoflush

if ($pid = fork) {
    close TO_CHILD; close FROM_CHILD;
    print FROM_PARENT "Parent Pid $$ is sending this\n";
    chomp($line = <TO_PARENT>);
    print "Parent Pid $$ just read this: '$line'\n";
    close TO_PARENT; close FROM_PARENT;
    waitpid($pid,0);
} else {
    die "cannot fork: $!" unless defined $pid;
    close TO_PARENT; close FROM_PARENT;
    chomp($line = <TO_CHILD>);
    print "Child Pid $$ just read this: '$line'\n";
    print FROM_CHILD "Child Pid $$ is sending this\n";
    close TO_CHILD; close FROM_CHILD;
    exit;
}

=cut
