#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use utf8;
use open qw(:std :utf8);
sub is_anagram($$)
{
    my ($word1, $word2) = (@_);

    if (!defined($word1) || !defined($word2))
    {
        return 0;
    }

    $word1 = lc($word1);
    $word2 = lc($word2);

    my $prepared_word1 = join("", sort(split(//, $word1)));
    my $prepared_word2 = join("", sort(split(//, $word2)));

    if ($word1 eq $word2)
    {
        return 0;
    }
    elsif ($prepared_word1 eq $prepared_word2)
    {
        return 1;
    }
}
sub anagram {
    my $arrayref = shift;

    my $i = 0;
    my %result_hash;
    my @tmp;
    my $j = 1;
    while ($i < scalar(@$arrayref))
    {
        # если анаграмма, которой еще нет в списке
        if (is_anagram($arrayref->[$i], $arrayref->[$j]) && !grep(/^$arrayref->[$j]$/, @tmp))
        {
            push @tmp, lc($arrayref->[$j]);
            delete @$arrayref[$j];
        }
        # если анаграмма, которая уже есть в списке
        elsif(defined(@$arrayref[$j]) && grep(/^$arrayref->[$j]$/, @tmp))
        {
            delete @$arrayref[$j];
        }
        # сохранение данных и/или переход к следующей итерации
        if ($j < scalar(@$arrayref)-1)
        {
            $j++;
        }
        else
        {
            if (scalar(@tmp) > 1)
            {
                $result_hash{lc($arrayref->[$i])} = [ @tmp ];
            }
            @tmp = ();
            $i++;
            $j = $i + 1;
        }
    }
    return \%result_hash;
}

my @list = ('пятак', 'ЛиСток', 'пятка', 'стул', 'ПяТаК', 'слиток', 'тяпка', 'столик', 'слиток', 'столик');
my $result = anagram(\@list);
print "$_: $_ @{$result->{$_}}\n" for sort keys %$result;