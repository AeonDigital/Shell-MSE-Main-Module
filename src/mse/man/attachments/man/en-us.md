# Synopsis

Expõe na tela um manual de função em formato `MarkDown`.



&nbsp;

# Parameters

## string file

- aka       : -f --file
- hint      :  
  Caminho até o arquivo do manual.


&nbsp;

## string sections

- aka       : -s --sections
- default   : 
- hint      :
  Nome das seções do documento que devem ser exibidas.

Se nenhuma seção for definida mostrará todas.
Quando definidas use espaços para separar cada uma das seções.

Valores comumente usados são:
- Synopsis
- Description
- Parameters
- Returns

Use aspas para nomes de seções que contenham espaços.

Este parametro serve apenas para as seções de primeiro nível do manual.


&nbsp;

## string dataParameters

- aka       : -dp --dataParameters
- default   : 
- hint      :
  Indica quais dados referentes aos parametros que devem ser mostrados.

Se ignorado ou inválido todos os itens serão mostrados.

Os seguintes valores podem ser escolhidos:
- type
- name
- aka
- default
- min
- max
- options
- hint
- description

Se desejar, pode mostrar mais de um tipo bastando informá-los separados por 
espaço.

Dados não aplicáveis aos parametros serão ignorados.


&nbsp;

## string dataReturn

- aka       : -dr --dataReturn
- default   : 
- hint      :
  Indica quais dados referentes ao retorno da função que devem ser mostrados.

Se ignorado ou inválido todos os itens serão mostrados.

Os seguintes valores podem ser escolhidos:
- type
- description

Se desejar, pode mostrar mais de um tipo bastando informá-los separados por 
espaço.

Dados não aplicáveis aos parametros serão ignorados.



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