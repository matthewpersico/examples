use IO::Handle;

sub diff_q {
    my ($file_a, $file_b) = @_;

    # note that we don't consider a failure to open both files as them being
    # the same, this matches the behavior of the previous diff -q
    # implementation
    open my $FH_A, '<', $file_a
        or return 1;
    open my $FH_B, '<', $file_b
        or return 1;

    if ((stat($FH_A))[7] != (stat($FH_B))[7]) {
        return 1;
    }

    my $buf_size = 8 * 1024;
    for (;;) {
        my ($buf_a, $buf_b);

        my $read_a = read($FH_A, $buf_a, $buf_size);
        my $read_b = read($FH_B, $buf_b, $buf_size);

        if ($read_a != $read_b) {
            return 1;
        }

        if ($buf_a ne $buf_b) {
            return 1;
        }

        if ($read_a == 0) {
            last;
        }
    }

    return 0;
}
