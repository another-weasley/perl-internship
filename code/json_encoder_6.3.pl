#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use JSON::XS;

sub serialize {
    my ($value) = @_;
    my $json_text = undef;
    $json_text = JSON::XS::encode_json($value);
    return $json_text;
}

my $VAR1 = {
          'b' => [
                   1,
                   '2',
                   3
                 ],
          'a' => 1,
          'c' => {
                   'b' => 2,
                   'a' => 1
                 }
        };
print (serialize($VAR1) eq  '{"b":[1,"2",3],"a":1,"c":{"b":2,"a":1}}');