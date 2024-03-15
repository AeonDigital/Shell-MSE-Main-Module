# Synopsis

Expõe na tela um manual de função em formato `MarkDown`.



&nbsp;

# Description




&nbsp;
    
# Parameters

## file file

- aka       : -f --file
- hint      :  
  Caminho até o arquivo do manual.


&nbsp;

## string sections

- aka       : -s --sections
- default   : .
- list op   :
  - synopsis
  - description
  - parameters
  - returns
  - examples
  - dependencies
- hint      :
  Nome das seções do documento que devem ser exibidas.

Se o valor passado for ignorado ou inválido, todas as seções serão mostradas.
Este parametro serve apenas para as seções de primeiro nível do manual.


&nbsp;

## string dataParameter

- aka       : -dp --dataParameter
- default   : .
- list      :
  - type
  - name
  - aka
  - default
  - min
  - max
  - options
  - list
  - hint
  - description
- hint      :
  Indica quais dados referentes aos parametros que devem ser mostrados.

Se o valor passado for ignorado ou inválido, todos parametros serão mostrados.


&nbsp;

## string dataReturn

- aka       : -dr --dataReturn
- default   : .
- list      : 
  - type
  - description
- hint      :
  Indica quais dados referentes ao retorno da função que devem ser mostrados.

Se o valor passado for ignorado ou inválido, todas informações serão mostrados.



&nbsp;

# Returns string

Printa na tela o manual alvo conforme as configurações selecionadas.