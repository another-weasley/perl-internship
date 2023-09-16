#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub fac {
    my ($n) = @_;
    my $fact = 1;
    for (my $i = 0; $i < $n; $i++)
    {
        $fact *= $i+1;
    }
    print "$fact\n";
}

fac(5);
fac(0);
fac(1);