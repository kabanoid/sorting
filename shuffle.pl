#!/usr/bin/perl

use strict;
use warnings;

use v5.18;

# 3 different shuffles

sub out {
    my @ary = @_;
    say join (" ", @ary);
}

sub shuffle1 {
    my @res = sort { rand(10) > 5 ? 1 : -1 } @_;
    return @res;
}

sub shuffle2 {
    my @in = @_;
    for my $i (1 .. scalar @in) {
        my $r = int (rand(scalar @in));
        ($in[$r], $in[$i-1]) = ($in[$i-1], $in[$r]);
    }
    return @in;
}

sub shuffle3 {
    my @in = @_;
    for my $i (1 .. scalar @in) {
        my $r = int (rand(scalar @in));
        ($in[0], $in[$r]) = ($in[$r], $in[0]);
    }
    return @in;
}
my @ary = qw/1 2 3 4 5 6 7 8 9/;

out(shuffle1(@ary));
out(shuffle2(@ary));
out(shuffle3(@ary));
