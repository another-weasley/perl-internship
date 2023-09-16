package Local::Product;
use strict;
use warnings FATAL => 'all';

sub new
{
    my ($class, %hash) = @_;
    my $obj_ref = undef;
    if (defined($hash{name}) &&
        ((defined($hash{price_rur}) && !defined($hash{price_usd})) ||
        (!defined($hash{price_rur}) && defined($hash{price_usd}))) &&
        !defined($hash{sum_rur}) && !defined($hash{sum_usd}))
    {
        $hash{count} //= 1;
        $hash{price_usd} //= $hash{price_rur} / 70;
        $hash{price_rur} //= $hash{price_usd} * 70;
        $obj_ref = bless \%hash, $class;
    }
}
sub name {
    my $self = shift;
    $self->{name} = $_[0] if @_;
    return $self->{name};
}
sub count
{
    my $self = shift;
    $self->{count} = $_[0] if @_;
    return $self->{count};
}
sub price_rur
{
    my $self = shift;
    if (@_)
    {
        $self->{price_rur} = $_[0];
        $self->{price_usd} = $_[0] / 70;
    }
    return $self->{price_rur};
}
sub price_usd
{
    my $self = shift;
    if (@_)
    {
        $self->{price_usd} = $_[0];
        $self->{price_rur} = $_[0] * 70;
    }
    return $self->{price_usd};
}
sub sum_rur
{
    my $self = shift;
    my $sum = $self->count * $self->price_rur;
    return $sum;
}
sub sum_usd
{
    my $self = shift;
    my $sum = $self->count * $self->price_usd;
    return $sum;
}
1;