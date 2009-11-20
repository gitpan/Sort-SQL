use strict;
use warnings;
use Test::More tests => 3;
use_ok('Sort::SQL');

#use Data::Dump qw( dump );

my $nefarious_sql = "name id; drop\rtable\rtest;\rselect\r1\r";

ok( my $parsed = Sort::SQL->string2array($nefarious_sql),
    "parse order string" );

#diag( dump($parsed) );

is_deeply( $parsed, [ { name => 'ASC' } ], "bad sql is stripped" );
