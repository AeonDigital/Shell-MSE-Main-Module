# Synopsis

Expõe na tela um manual de função em formato `MarkDown`.



&nbsp;

# Description




&nbsp;
    
# Parameters

## string file

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
- hint      :
  Nome das seções do documento que devem ser exibidas.

Se o valor passado for ignorado ou inválido, todas as seções serão mostradas.
Este parametro serve apenas para as seções de primeiro nível do manual.

Seções customizadas precisam ser informadas aqui para serem reconhecidas.


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

## int maxLevel

- aka       : -ml --maxLevel
- default   : 2
- min       : 1
- max       : 6
- hint      :
  Indica o nível máximo de subseções que devem ser exibidas.

Por padrão será usado o nível `2` para trazer também as informações dos 
parametros das funções pois eles são definidos como seções de segundo nível.



&nbsp;

# Returns string

Printa na tela o manual alvo conforme as configurações selecionadas.