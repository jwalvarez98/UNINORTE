#!/usr/bin/perl

#Valida un nombre de usuario en twitter, empieza por @ y 
#puede contener letras mayúsculas y minúsculas, números, 
#guiones y guiones bajos.

use strict;
use warnings FATAL => 'all';

# user validator subroutine
sub user_validation {
    # receiving the first parameter passed to the function as the plate to be validated
    my $user = $_[0];
    print "'$user' ";
    if ($user =~ /\A@([A-Za-z]|\d|-|_)+\z/) {
        print "usuario de twitter VÁLIDO\n";
    }
    else {
        print "usuario de twitter INVÁLIDO\n";
    }
}



print "VALIDAR NOMBRE DE USUARIO EN TWITTER (emoji pajaro here)\n\n";
print "Ingrese tantos usuarios como quiera\n";
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
