# Synopsis

Mostra uma mensagem para o usuário no terminal.



&nbsp;

# Parameters

## assoc arrayConfig

- aka       : -a --arrayConfig
- hint      :  
  Nome do array associativo contendo as configurações da mensagem.

Se omitido ou inválido, será iniciado o array associativo 
`MSE_MESSAGE_THEME_CONFIG` usando o tema padrão e este será usado para a 
formatação da mensagem.


&nbsp;

## string type

- aka       : --type
- default   : n
- options   : 
  - n   : none
  - i   : info
  - a   : attention
  - w   : warning
  - e   : error
  - f   : fail
  - s   : success

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


**Mensagens de Alerta**

- none      | n   : Não definido; nenhum
- info      | i   : Informação genérica.
- attention | a   : Atenção.
- warning   | w   : Alerta.
- error     | e   : Erro em uma operação.
- fail      | f   : Falha em uma operação.
- success   | s   : Sucesso em uma operação.


**Mensagens de Prompt**

- friendly  | fr  : Amigável. Questão sem muita importância.
- ordinary  | or  : Comum. Questão padrão.
- caution   | ca  : Cuidado. Questão que exige atenção do usuário ou 
                    que tenha potencial de alguma alteração permanente.
- important | im  : Importante. Questão com potencial de causar alteração
                    permanente no processamento do script ou no próprio PC.


&nbsp;

## string format

- aka       : --format
- hint      :  
  Estilo do formato de apresentação da mensagem (conforme disponível pelo 
  tema).

Cada tema pode fornecer vários formatos de mensagem, se for o caso, neste
parametro deve ser indicado qual deve ser usado. De outra forma o formato 
padrão será utilizado.


&nbsp;

## string titleString

- aka       : --titleString
- hint      :  
  Título da mensagem.

Se `""`, usará o título padrão conforme o `type` de mensagem, ou, deixará a
linha do título vazia em caso de tipo de mensagem `none`.


&nbsp;

## array bodyLines

- aka       : --bodyLines
- hint      :  
  Nome do array que trás as linhas de dados a serem apresentadas.


&nbsp;

## assoc extraConfig

- aka       : --extraConfig
- hint      :  
  Nome de um array associativo trazendo configurações extras. 

Usado para expandir temas.
Trata-se de configurações imprevistas dentro do esquema padrão.



&nbsp;

# Returns string

Printa na tela a mensagem indicada conforme configuração passada.