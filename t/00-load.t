#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Finance::TW::CurrencyConvert' );
}

diag( "Testing Finance::TW::CurrencyConvert $Finance::TW::CurrencyConvert::VERSION, Perl $], $^X" );
