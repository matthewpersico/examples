use strict;
use warnings;

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
