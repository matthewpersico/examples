package IsAFoo;

## use parent qw(Foo);
push @ISA, qw (Foo);

sub isafoofunc {
    print join(' ',
               "I am",
               (caller(0))[3],
               "in package",
               __PACKAGE__,
               "in file",
               __FILE__,
               "\n\t",
               "with args",
               @_,
           ) . "\n";
}

1;
