use strict;
use warnings;
sub min_and_max {
    my ($x, $y, $z) = @_;
    my $min = undef;
    my $max = undef;
    if ($x >= $y && $x >= $z)
    {
        $max = $x;
        if ($y >= $z) {$min = $z; }
        else {$min = $y;}
    }
    elsif ($y >= $z && $y >= $x)
    {
        $max = $y;
        if ($x >= $z) {$min = $z; }
        else {$min = $x;}
    }
    else
    {
        $max = $z;
        if ($x >= $y) {$min = $y; }
        else {$min = $x; }
    }
    print "$min, $max\n"
}

min_and_max(2, 1, 3);