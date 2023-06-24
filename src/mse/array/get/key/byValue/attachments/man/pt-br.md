# Synopsis

Identifica o índice correspondente ao valor passado no array associativo 
indicado.



&nbsp;

# Parameters

## string value

- aka       : -v --value
- hint      :  
  Valor que está sendo pesquisado.


&nbsp;

## assoc arrayName

- aka       : -a --arrayName
- hint      :  
  Nome do array associativo onde a pesquisa deve ser feita.


&nbsp;

## bool caseSensitive

- aka       : -cs --caseSensitive
- default   : 1
- hint      :  
  A pesquisa deve ser feita em `case sensitive`?



&nbsp;

# Returns int

Retorna a chave no array associativo que corresponde ao valor indicado.
An empty value is returned if nothing is found.