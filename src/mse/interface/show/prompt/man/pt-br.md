# Synopsis

Mostra uma mensagem para o usuário e permite que ele ofereça uma resposta.

O resultado selecionado/digitado pelo usuário ficará definido na variável
global 'MSE_PROMPT_RESULT'.



&nbsp;

# Parameters

## assoc arrayConfig

- aka       : -a --arrayConfig
- hint      :  
  Nome do array associativo contendo as configurações da mensagem.

Se omitido ou inválido, será iniciado o array associativo 
"MSE_MESSAGE_THEME_CONFIG" usando o tema padrão e este será usado para a 
formatação da mensagem.


&nbsp;

## string type

- aka       : --type
- default   : n
- options   : 
  - n   : none
  - fr  : friendly
  - or  : ordinary
  - ca  : caution
  - im  : important
- hint      :  
  Tipo de mensagem.

Configure o tipo da mensagem a ser mostrada para o usuário.
Cada tema tem a responsabilidade de fazer os ajustes necessários conforme este 
parametro.

Abaixo segue uma descrição breve do significado de cada tipo e para qual 
finalidade ele deve ser usado.

**Mensagens de Prompt**

- friendly  | fr  : Amigável. Questão sem muita importância.
- ordinary  | or  : Comum. Questão padrão.
- caution   | ca  : Cuidado. Questão que exige atenção do usuário ou 
                    que tenha potencial de alguma alteração permanente.
- important | im  : Importante. Questão com potencial de causar alteração
                    permanente no processamento do script ou no próprio PC.


&nbsp;

## string titleString

- aka       : --titleString
- hint      :  
  Título da mensagem.

Se "", usará o título padrão conforme o `type` de mensagem, ou, deixará a
linha do título vazia em caso de tipo de mensagem `none`.


&nbsp;

## string returnType

- aka       : --returnType
- default   : v
- options   : 
  - b  : bool
  - l  : list
  - v  : value
- hint      :  
  Tipo de valor que é esperado como resposta do prompt.

Se nenhum valor for informado, ou, se informado um valor inválido, usará o tipo 
'value'.

Abaixo segue uma breve descrição de cada um dos tipos de retorno.

- b | bool  : espera uma resposta booleana 
- l | list  : espera uma resposta baseada em uma lista pré-definida.
- v | value : aceita qualquer resposta como válida.


&nbsp;

## assoc arrayListOptions

- aka       : -alo --arrayListOptions
- hint      :  
  Nome do array associativo contendo as opções de seleção válidas.

Usado apenas para prompts que tem `list` como `returnType`.
Para este caso, considere que:
  key   : Valores que serão efetivamente definidos pela ação do usuário.
  value : Coleção de rótulos que podem ser usados para representar este valor. 
          Separe cada rótulo por espaço.
          É uma boa pratica envolver cada rótulo entre aspas para permitir assim
          o uso de nomes com espaços.

Se o valor deste parametro for definido e for inválido, o `returnType` será 
convertido para o tipo `value`.


&nbsp;

## bool caseSensitive

- aka       : -cs --caseSensitive
- default   : 1
- hint      :  
  Indica quando a comparação de valores válidos deve ser feita em case 
  sensitive.

Usado apenas para prompts que tem `list` como `returnType`.



&nbsp;

# Returns string

Printa na tela a mensagem indicada conforme configuração passada.