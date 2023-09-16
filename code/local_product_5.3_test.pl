#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Local::Product;

my $product = Local::Product->new(name => 'Фуфырка обыкновенная', price_rur => 350, count => 5);
print $product->price_rur; # 350
print $product->price_usd; # 5

$product->price_usd(7);
print $product->price_rur; # 490
print $product->price_usd; # 7

$product->count(10);
print $product->sum_rur;   # 4900
print $product->sum_usd;   # 70