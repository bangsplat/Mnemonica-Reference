#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long;

my $stack_str = "";
my $stack_line = "";

# load up default values for the parameters
my $stack_file_name = "stack.txt";
my $stack_file_size = 1000;
my $performance_mode = 0;

my $pos = 0;
my @elements;

GetOptions( 'stack=s'           =>  \$stack_file_name,
            'performance|p!'    =>  \$performance_mode,
            'size=i'            =>  \$stack_file_size );


# print "DEBUG:\n";
# print "\$stack_file_name: $stack_file_name\n";
# print "\$stack_file_size: $stack_file_size\n";
# print "\$performance_mode: $performance_mode\n\n";

# open the stack file
open( my $fh, "<", $stack_file_name )
    or die "Can't open stack file: $!";
    
read( $fh, $stack_str, $stack_file_size );

if ( $performance_mode ) {
    print "Mnemonica\n";
    # open stack_str as if it were a file
    open ( my $strh, "<", \$stack_str ) or die $!;
    while ( $stack_line = <$strh> ) {
        @elements = split( /\s+/, $stack_line );
        print "Number $elements[0]: the $elements[1] of $elements[2]s\n";
    }
    close( $strh );
} else {
    print( "$stack_str\n" );
}


close( $fh );
