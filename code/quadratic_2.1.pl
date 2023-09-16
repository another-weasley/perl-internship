#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub solve_equation {
    my ($a_value, $b_value, $c_value) = @_;
    my $x1 = undef;
    my $x2 = undef;
    my $disc = undef;
    # zero-exception check
    if ($a_value == 0)
    {
        print "No solution!\n";
        return();
    }
    # basic solution
    $disc = $b_value ** 2 - 4 * $a_value * $c_value;
    if ($disc < 0) { print "No solution!\n"; }
    elsif ($disc == 0)
    {
        $x1 = (-$b_value - sqrt($disc)) / (2 * $a_value);
        print "$x1\n";
    }
    else
    {
        $x1 = (-$b_value - sqrt($disc)) / (2 * $a_value);
        $x2 = (-$b_value + sqrt($disc)) / (2 * $a_value);
        if ($x1 < $x2) { print "$x1, $x2\n"; }
        else { print "$x2, $x1\n"; }
    }
}

solve_equation(0, 1, 2);
solve_equation(-2, 0, 128);
solve_equation(1, 0, 0);