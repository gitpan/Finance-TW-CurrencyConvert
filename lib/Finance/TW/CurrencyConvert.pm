package Finance::TW::CurrencyConvert;

use warnings;
use strict;
use utf8;
use WWW::Mechanize;
use Encode;
use base qw/Exporter/;
our @EXPORT=qw/ConvertCurrencyUsingTWQuote/;

=head1 NAME

Finance::TW::CurrencyConvert - Currency convertor using the quote from Taiwan's financial market

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

This is a currency convertor using real-time quote data from Taiwan's financial market. Supported currency symbols include: USD, NTD, JPY, HKD, MCY, GRP, ECU, CAD, AUD. THB. SGD, KOW, IDR, MYR, PHP, INR, SAR, KWD, NOK, SWF, SEK, DMK, BRC, MEP, ARS, CLP, VEB, ZAR, RUR, NZD

    use Finance::TW::CurrencyConvert;
    
    # how much is USD 100 in NTD today?
    my $result=ConvertCurrencyUsingTWQuote(100, "USD", "NTD"); 

=head1 FUNCTIONS

=head2 ConvertCurrencyUsingTWQuote($sum, $from, $to)

=cut

my %curlist=qw/USD 1 NTD 2 JPY 3 HKD 4 MCY 5 GRP 6 ECU 7 CAD 8 AUD 9 THB 10 SGD 11 KOW 12 IDR 13 MYR 14 PHP 15 INR 16 SAR 17 KWD 18 NOK 19 SWF 20 SEK 21 DMK 22 BRC 23 MEP 24 ARS 25 CLP 26 VEB 27 ZAR 28 RUR 29 NZD 30/;

my $yahoo="http://tw.stock.yahoo.com/d/c/ex.php?money=%s&select1=%d&select2=%d";

sub ConvertCurrencyUsingTWQuote {
    my ($sum, $from, $to)=(shift, uc shift, uc shift);
    die "cannot find currency symbol $from" if (!$curlist{$from});
    die "cannot find currency symbol $to" if (!$curlist{$to});

    my $q=sprintf($yahoo, $sum, $curlist{$from}, $curlist{$to});
    my $m=WWW::Mechanize->new();
    $m->get($q);
    my $d=decode("big5", $m->content());
    my @r=($d =~ /經過計算後，([\d.]+).+等於&nbsp;&nbsp;([\d.]+)/);
    return $r[1];
}

=head1 AUTHOR

Lukhnos D. Liu, C<< <lukhnos@cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-finance-tw-currencyconvert@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Finance-TW-CurrencyConvert>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 COPYRIGHT & LICENSE

Copyright 2005 Lukhnos D. Liu, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Finance::TW::CurrencyConvert
