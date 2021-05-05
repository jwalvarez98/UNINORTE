#!/usr/bin/perl

#1. Validación de una dirección IP, ya que esta está formada 
#por la forma [0-255].[0-255].[0-255].[0-255].

use strict;
use warnings FATAL => 'all';

# user validator subroutine
sub ip_validation {
    # receiving the first parameter passed to the function as the plate to be validated
    my $ip = $_[0];
    print "'$ip' ";

    if ($ip =~ /\A(\d|[1-9]\d|[1]\d\d|[2][0-5][0-5])(.(\d|[1-9]\d|[1]\d\d|[2][0-5][0-5])){3}\z/) {
        print "dirección ip VÁLIDA\n";
    }
    else {
        print "dirección ip INVÁLIDA\n";
    }
}

print "VALIDAR DIRECCIÓN IP\n\n";
print "Ingrese tantas IPs como quiera\n";
print "Para salir presione CTRL+D o CTRL+C\n\n";

# looping until we EOF
for (;;) {
    # getting the current input user
    my $ip = <STDIN>;
    # break the loop if there are no input
    last if not defined $ip;
    chomp $ip;
    # validate user received
    ip_validation($ip);
}
