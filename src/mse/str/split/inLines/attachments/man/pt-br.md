# Synopsis

Efetua um split na string passada separando-a em múltiplas linhas usando o 
caracter `\n` como divisor.



&nbsp;

# Description

Você pode definir um número máximo de caracteres por linha.

Neste caso, após o split inicial (usando o caracter `\n`), cada linha será
verificada individualmente e, se alguma delas possuir um número de caracteres 
além do limite definido, esta será então dividida em quantas linhas forem 
necessárias para que cada uma delas esteja em conformidade com a limitação 
exposta.

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


## bool isParagraph

- aka       : -p -isParagraph
- default   : 0
- hint      :  
  Indica quando a string original deve ser tratada como um paragrafo.

Se `1` irá primeiramente remover todas as quebras de linhas existentes 
substituindo-as por espaços vazios e então o split das linhas será feito usando 
o limite de tamanho de linha definido.



# Returns array

O resultado será definido no array indicado.