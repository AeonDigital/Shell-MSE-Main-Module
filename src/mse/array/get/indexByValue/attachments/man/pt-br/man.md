# Synopsis

Identifica o índice correspondente ao valor passado no array indicado.



&nbsp;

# Parameters

## string value

- aka       : -v --value
- hint      :  
  Valor que está sendo pesquisado.


&nbsp;

## array arrayName

- aka       : -a --arrayName
- hint      :  
  Nome do array onde a pesquisa deve ser feita.


&nbsp;

## bool caseSensitive

- aka       : -cs --caseSensitive
- default   : 1
- hint      :  
  A pesquisa deve ser feita em `case sensitive`?



&nbsp;

# Returns int

Retorna o índice no array que corresponde ao valor indicado.
Um valor vazio é retornado se nada for encontrado.