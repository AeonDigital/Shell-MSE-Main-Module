# Synopsis

Efetua um split na string passada separando-a em linhas.



&nbsp;

# Description

Você pode definir um número máximo de caracteres por linha.
Palavras que excedam o limite da linha formarão uma nova linha dentro do limite 
definido.
Se uma palavra for grande demais para caber em uma linha ela ficará em uma 
linha só para si que poderá exceder o limite exposto.



&nbsp;

# Parameters

## array arrayName

- aka       : -a --arrayName
- hint      :  
  Nome do array que será preenchido com o resultado do processamento.

&nbsp;


## string string

- aka       : -s --string
- hint      :  
  String original.

&nbsp;


## int maxLineLength

- aka       : -m -maxLineLength
- default   : -1
- hint      :  
  Número máximo de caracteres por linha.

Por padrão o valor deste parametro será `-1` o que significa que não há limite
de caracteres para cada linha identificada. Este também será o valor usado em
caso de receber um valor inválido.
Se o valor informado for `0` usará como limitador de numero de caracteres para
cada linha o valor atual da variável `$COLUMNS`.


&nbsp;



# Returns array

O resultado será definido no array indicado.