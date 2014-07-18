#!perl -w

use strict;
use Test::More 0.96;
use Test::Command;

my $cmd = './rpn';

stdout_is_eq [ $cmd, qw( 2 2 + ) ],            "4\n";
stdout_like  [ $cmd, qw( 2 3 / ) ],            qr/^0\.6+7$/m;
stdout_is_eq [ $cmd, qw( 1 2 3 * - ) ],        "-5\n";
stdout_is_eq [ $cmd, qw( 2 3 ** ) ],           "8\n";
stdout_like  [ $cmd, qw( 2 1 2 / ** ) ],       qr/^1\.414/m;
stdout_like  [ $cmd, qw( 2 sqrt ) ],           qr/^1\.414/m;
stdout_is_eq [ $cmd, qw( 1 2 | ) ],            "3\n";
stdout_is_eq [ $cmd, qw( 1 3 & ) ],            "1\n";
stdout_is_eq [ $cmd, qw( 1 3 ^ ) ],            "2\n";
stdout_is_eq [ $cmd, qw( 2 3 swap / ) ],       "1.5\n";
stdout_is_eq [ $cmd, qw( 2 dupl * ) ],         "4\n";
stdout_like  [ $cmd, qw( 2pi 8 / cos ) ],      qr/^0\.707/m;
stdout_is_eq [ $cmd, qw( tau 8 / tan ) ],      "1\n";
stdout_is_eq [ $cmd, qw( τ π / ) ],            "2\n";
stdout_like  [ $cmd, qw( 1 exp ) ],            qr/^2\.718/m;
stdout_like  [ $cmd, qw( e ) ],                qr/^2\.718/m;
stdout_is_eq [ $cmd, qw( 1024 log 2 log / ) ], "10\n";
stdout_like  [ $cmd, qw( tau dupl int - ) ],   qr/^0\.283/m;

done_testing;
