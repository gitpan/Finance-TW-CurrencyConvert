#!perl -T

use utf8;
use Test::More tests => 1;

use Finance::TW::CurrencyConvert;
is(ConvertCurrencyUsingTWQuote(1, "NTD", "NTD"), 1);
