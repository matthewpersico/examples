use strict;
use warnings;

use Data::Dumper;

package CardDefs;

## Static package of functions
sub suits {
    qw(h d c s);
}

sub ranks {
    qw( A 2 3 4 5 6 7 8 9 10 J Q K);
}

1;

package Card;

sub new {
    my $class = shift;
    my %args  = (
        suit => undef,
        rank => undef,
        @_
    );
    return bless {%args}, $class;
}

sub id {
    my $self = shift;
    return "$self->{rank}$self->{suit}";
}

1;

package Deck;

sub new {
    my $class = shift;
    my @cards;

    for my $suit ( CardDefs::suits() ) {
        for my $rank ( CardDefs::ranks() ) {
            my $card = Card->new(
                suit => $suit,
                rank => $rank
            );
            push @cards, $card;
        }
    }

    return bless { cards => \@cards }, $class;
}

sub shuffle {
    my $self = shift;

    my $i = @{ $self->{cards} } - 1;
    while ( $i > -1 ) {
        my $j = int( rand(51) );
        ( $self->{cards}->[$i], $self->{cards}->[$j] ) =
          ( $self->{cards}->[$j], $self->{cards}->[$i] );
        $i--;
    }
}

sub show {
    my $self = shift;
    for my $card ( @{ $self->{cards} } ) {
        print $card->id(), ' ';
    }
}

sub get {
    my $self = shift;
    return @{ $self->{cards} }
      ? pop @{ $self->{cards} }
      : undef;
}

sub put {
    my $self = shift;
    push @{ $self->{cards} }, $_[0]; ## Should add error check to make sure it's
    ## a Card
}

1;

sub deal {
    my %args = (
        deck    => undef,
        hands   => 0,
        perhand => 0,
        @_
    );

    my @deal;
    for my $perhand ( 1 .. $args{perhand} ) {
        for my $hands ( 1 .. $args{hands} ) {
            $deal[$hands] = []
              if not defined $deal[$hands];
            push @{ $deal[$hands] }, $args{deck}->get();
        }
    }
    return @deal;
}

1;

my $deck = Deck->new();

my $i = 100;
$deck->shuffle() while ( $i-- );

$deck->show;

my @deal = deal(
    deck    => $deck,
    hands   => 5,
    perhand => 6
);

print Data::Dumper->Dump( [ \@deal ], [qw(*deal)] );
