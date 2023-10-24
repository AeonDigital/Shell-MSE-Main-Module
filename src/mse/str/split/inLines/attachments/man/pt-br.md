# Synopsis

Efetua um split na string passada em um array onde cada linha terá no máximo o 
número de caracteres informados.
As palavras identificadas serão mantidas sem serem separadas entre as linhas.



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