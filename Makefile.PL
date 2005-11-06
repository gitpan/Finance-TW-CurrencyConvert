use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Finance::TW::CurrencyConvert',
    AUTHOR              => 'Lukhnos D. Liu <lukhnos@cpan.org>',
    VERSION_FROM        => 'lib/Finance/TW/CurrencyConvert.pm',
    ABSTRACT_FROM       => 'lib/Finance/TW/CurrencyConvert.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
		'Encode' => 0,
		'WWW::Mechanize' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Finance-TW-CurrencyConvert-*' },
);
