#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub primes_from_interval {
    my ($x, $y) = @_;
    my $is_prime = 1;
    for (my $i = $x; $i <= $y; $i++)
    {
        for (my $j = 2; $j < $i; $j++)
        {
            if ($i % $j == 0) { $is_prime = 0 };
        }
        if ($is_prime && $i > 1)
        {
            print "$i\n";
        }
        $is_prime = 1;
    }
}

primes_from_interval(1, 5);
primes_from_interval(-1, 1);