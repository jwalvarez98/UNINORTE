#!/usr/bin/perl

#1. Validación de una dirección IP, ya que esta está formada 
#por la forma [0-255].[0-255].[0-255].[0-255].

use strict;
use warnings FATAL => 'all';

# user validator subroutine
sub user_validation {
    # receiving the first parameter passed to the function as the plate to be validated
    my $user = $_[0];
    print "'$user' ";

    #un numero [0-9]                            0-9
    #dos numeros [1-9][0-9]                     1-99
    #tres numeros [1][0-9][0-9]|[2][0-5][0-5]   100-255

    #Campo ip [1-255], es decir un solo numero de 1 a 255
    #([1-9]|[1-9]\d|[1]\d\d|[2][0-5][0-5])

    if ($user =~ /\A(\d|[1-9]\d|[1]\d\d|[2][0-5][0-5]).(\d|[1-9]\d|[1]\d\d|[2][0-5][0-5]).(\d|[1-9]\d|[1]\d\d|[2][0-5][0-5]).(\d|[1-9]\d|[1]\d\d|[2][0-5][0-5])\z/) {
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
    my $user = <STDIN>;
    # break the loop if there are no input
    last if not defined $user;
    chomp $user;
    # validate user received
    user_validation($user);
}
