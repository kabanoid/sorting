#!/usr/bin/perl -s

use strict;
use warnings;

use v5.18;

# insertion sort implementation

sub in_sort {
    my @a = @_;
    $| = 1;
    for (my $i = 1; $i <= $#a; $i++) {
        my $n = $i;
        while ($a[$n] < $a[$n-1] && $n > 0) {
            ($a[$n-1], $a[$n]) = ($a[$n], $a[$n-1]);

            my @b = @a;
            $b[$n-1] = "[". $b[$n-1] . "]";
            $b[$i] .= "*";

            if (defined $ARGV[1]) {
                print join (" ", @b);
                print "\r";
                select (undef, undef, undef, 0.125);
            }
            $n--;
        }
    }
    return @a;
}

die "Usage: $0 N [v], where N is a number of elements in unsorted array and v is an optional verbose flag" unless defined $ARGV[0];

print "\n============= PROGRESS: =============\n" if defined $ARGV[1];

my @unsorted = map { int(rand(100)) } (1 .. $ARGV[0]);
my @sorted = in_sort(@unsorted);

say "UNSORTED: ", join (" ", @unsorted);
say "SORTED:   ", join (" ", @sorted);
