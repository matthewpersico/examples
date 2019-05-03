#!/usr/bin/env perl
use strict;

# Get all the letters from stdin:
my $input = do { local $/; <> };
$input =~ s/[^a-zA-Z]//g;

# All 3+ letter English words, longest to shortest:
my @long = grep { length > 2 }
  sort { length $b <=> length $a }
  map { chomp, $_ } `cat /usr/share/dict/words`;
# Too many small words in dict file. Use these:
my @short = qw(
  ad ah am an as at ax be by do go he hi if in is it
  me my no of oh on or ox pi so to up us we yo a I
);
# Make a gigantic list of words for the regexp:
my $list = join '|', @long, @short;

# Parse words from spaceless input using one regexp match:
our @stack;    # Non-lexical stack variable for regexp local.
my @words;     # Copy final stack here.
$input =~ /
                        ^(?:
                                # When we match a word, push onto a local stack.
                                        # Backtracking will pop automatically for us!!!
                                                ($list)(?{
                                                            # Print each matching word in DEBUG mode:
                                                                        print "$^N\n" if $ENV{DEBUG};
                                                                                    local @stack = (@stack, $^N);
                                                                                            })
                                                                                                )*$(?{@words=@stack})  # Stack will go away, so save final.
                                                                                                /gx
  or die "Parse failed";

# Print the parsed words with a space between each:
print "@words\n";
