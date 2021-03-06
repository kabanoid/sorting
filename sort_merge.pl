#!/usr/bin/perl

use strict;
use warnings;

use v5.18;

=head1 NAME

sort_merge.pl - an implementation of merge sort algorythm

=head1 USAGE

Give me a positive integer value N and I will sort the random array of N elements

=cut

sub merge_sort {
    my @list = @_;
    my $m = scalar @list;

    return @list if ($m <= 1); # an empty list or single-element list is considered to be sorted

    # divide a list into two smaller lists
    my @left    = merge_sort (splice(@list, 0, int($m/2)));
    @list       = merge_sort (@list);

    return merge (\@left, \@list);
}

sub merge {
    my ($left, $right) = @_;
    my @res = ();

    while (@$left && @$right) {
        $left->[0] <= $right->[0]
            ? push (@res, shift @$left)
            : push (@res, shift @$right);
    }

    push (@res, @$left);
    push (@res, @$right);

    return @res;
}

die "Usage: $0 n, where n is a number of elements in unsorted array" unless defined $ARGV[0];

my @unsorted = map { int(rand(100)) } (1 .. $ARGV[0]);
my @sorted = merge_sort(@unsorted);

say "UNSORTED: ", join(" ", @unsorted); 
say "SORTED:   ", join(" ", @sorted);
