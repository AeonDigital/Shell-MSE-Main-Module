# Synopsis

Mostra os atributos de fonte que podem ser utilizados para a estilização das 
mensagens da interface.



&nbsp;

# Parameters

## char format

- aka       : -f --format
- default   : l
- options   : 
  - l: list
  - t: table
- hint      :  
  Indica o formato que os atributos devem ser apresentados.

Use `l | list` ou omita este parametro para ver uma lista linha a linha com o 
nome de cada atributo ou `t | table`.


&nbsp;

## int itensPerLine

- aka       : -ipl --itensPerLine
- default   : 6
- hint      :
  Indique a quantidade de itens por linha que devem ser mostrados.

Se omitido, assumirá o total de 6 itens por linha.



&nbsp;

# Returns string

Printa na tela as opções de atributos conforme o formato de apresentação 
selecionado.