package Foo;

sub foofunc {
    print join( ' ',
        "I am",
        ( caller(0) )[3],
        "in package",
        __PACKAGE__,
        "in file",
        __FILE__,
        "\n\t",
        "with args",
        @_,
    ) . "\n";
}

package Bar;

sub foofunc {
    return ( Foo::foofunc(@_) );
}
1;
