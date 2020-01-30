use strict;
use warnings;

my $val = eval { 42 };
print "val=$val, \$? = $?\n" ;

$val = eval {
    if ($ARGV[0] == 1) { return 44 }
    die "ARGV[0] was $ARGV[0], not 1";
};

if (defined $val) { print "Got $val out of the eval block\n"; }
else { print "Got \$\@ out of the eval block: $@" }

$val = eval {
    if ($ARGV[0] == 1) { exit 44 }
    die "ARGV[0] was $ARGV[0], not 1";
};

if (defined $val) { print "Got $val out of the eval block\n"; }
else { print "Got \$\@ out of the eval block: $@" }

sub prnt_then_die {
    print STDOUT "STDOUT texxt\n";
    print STDERR "STDERR texxt\n";
    die "die message";
}

eval {
    print "calling prnt_then_die in eval\n";
    prnt_then_die();
};
print "calling prnt_then_die outside eval\n";
prnt_then_die();

print "after calling prnt_then_die outside eval\n";
