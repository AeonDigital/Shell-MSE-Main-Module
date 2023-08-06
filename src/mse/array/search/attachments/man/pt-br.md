# Synopsis

Identifica se o valor indicado existe no array alvo.



&nbsp;

# Parameters

## string value

- aka       : -v --value
- hint      :  
  Valor sendo pesquisado.


&nbsp;

## assoc arrayName

- aka       : -a --arrayName
- hint      :  
  Nome da matriz onde a pesquisa deve ser feita.


&nbsp;

## bool caseSensitive

- aka       : -cs --caseSensitive
- default   : 1
- hint      :  
  Indica se a verificação deve ser feita em "insensitive case"

Omitir ou indique "0" para "case sensitive" (padrão)
Indique "1" para "case insensitive"


&nbsp;

## bool ignoreGlyphs

- aka       : -ig --ignoreGlyphs
- default   : 0
- hint      :  
  Indique se você deseja que a comparação seja feita ignorando glifos.

Neste caso, os valores testados serão convertidos em ASCII.
Omita ou indique "0" para fazer uma comparação usando o valor real.
Digite "1" para ignorar os glifos na comparação.


&nbsp;

## bool subArray

- aka       : -sa --subArray
- default   : 0
- hint      :  
  Indique se os valores da matriz passada devem ser tratados como uma submatriz 
  de valores.

Omita ou digite "0" para que a comparação seja feita usando o valor total de
cada um item (padrão).
Digite "1" para executar a verificação de subvalor.


&nbsp;

## string returnType

- aka       : -r --returnType
- default   : b
- options   : 
  - b  : bool
  - i  : index k key
- hint      :  
  Indique o tipo de retorno esperado.

Se "b", retornará um booleano indicando a existência ou não do valor passado 
entre os valores do array.
Se "i", retornará o índice ou nome da chave em que o valor passado foi 
encontrado. Uma string vazia será retornada caso não exista.



&nbsp;

# Returns int

Varia conforme a definição do parametro "returnType"