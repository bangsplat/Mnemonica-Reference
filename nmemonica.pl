#!/usr/bin/perl

use strict;
use warnings;

my $stack_file_name = "stack.txt";
my $stack_file_size = 1000;

my $stack;

open( my $fh, "<", $stack_file_name )
    or die "Can't open stack.txt: $!";
    
read( $fh, $stack, $stack_file_size );

print( "$stack\n" );

close( $fh );
