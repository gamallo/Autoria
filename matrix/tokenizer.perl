#!/usr/bin/perl -w

#Tokenizer:
#lê um ficheiro texto linha a linha
#Separa os símbolos especiais
#quebra as linhas cada vez que encontra um espaço em branco
#escreve um tokem ou símbolo por linha

binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
use utf8;


$Separador = "[\.\,\;\:\«\»\&\%\+\=\$\(\)\<\>\!\¡\?\¿\\[\\]]" ;

while ($line=<STDIN>) {
      chop($line);
       
      $line =~ s/($Separador)/ $1 /g;
      #$line =~ s/\s+/ /g;
      
     
      @ListaDeTokens = split(" ", $line);
      foreach $token (@ListaDeTokens) {
	 
        print "$token\n";
        
      }
}


#print STDERR "Fim do tokenizer\n";


