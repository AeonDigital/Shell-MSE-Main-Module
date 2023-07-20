# Synopsis

Prepara um array associativo preenchendo as chaves necessárias para a execução
de um comando **mse_interface_progressBar**.



&nbsp;

# Description

Se nenhum critério de configuração for passado, toda mensagem será definida 
pelo tema vigente.

A barra de progresso é um componente de uma única linha e as configurações 
possíveis são divididas em três blocos.



&nbsp;

## Parte 01: Meta formatação

Aqui são definidas propriedades que afetam todas as demais partes do corpo da 
barra de progresso.
Chaves definidas nesta parte:

- meta_theme
- meta_format
- meta_indent


&nbsp;

## Parte 02: Barra de progresso

Trata-se da formação da barra de progresso em si.
Chaves definidas nesta parte:

- bar_ini_string
- bar_end_string
- bar_fill_char
- bar_max_char_length
- bar_atual_progress
- bar_atual_bar_length
- bar_color
- bar_color_alt
- bar_colorize


&nbsp;

## Parte 03: Informações

Configura as informações que aparecem ao lado da barra.  
Chaves definidas nesta parte:

- info_show
- info_align
- info_ini_string
- info_end_string
- info_use_percent
- info_data
- info_color
- info_color_alt
- info_colorize



&nbsp;

# Parameters

## string arrayName

- aka       : -a --arrayName
- hint      :  
  Nome do array associativo que será preenchido.





&nbsp;

## string theme

- aka       : --theme
- hint      :  
  Nome do tema a ser usado para gerar a barra de progresso.

["meta_theme"]
As configurações do tema sobrescreverão quaisquer outras configurações 
definidas nesta função.


&nbsp;

## string format

- aka       : --format
- hint      :  
  Estilo do formato de apresentação da barra de progresso (conforme disponível 
  pelo tema).

["meta_format"]
Cada tema pode fornecer vários formatos de barra, se for o caso, neste 
parametro deve ser indicado qual deve ser usado. De outra forma o formato 
padrão será utilizado.


&nbsp;

## string indent

- aka       : --indent
- hint      :  
  Indentação para a barra de progresso.

["meta_indent"]
Use apenas espaços em branco ou deixe vazio para não usar.





&nbsp;

## string barIniString

- aka       : --barIniString
- hint      :  
  Caracteres que demarcam o início da barra de progresso.

["bar_ini_string"]


&nbsp;

## string barEndString

- aka       : --barEndString
- hint      :  
  Caracteres que demarcam o fim da barra de progresso.

["bar_end_string"]


&nbsp;

## char barFillChar

- aka       : --barFillChar
- hint      :  
  Caracter que será usado para preencher a barra de progresso.

["bar_fill_char"]
Se for deixado vazio, usará o caracter padrão definido no tema.


&nbsp;

## int barMaxCharLength

- aka       : --barMaxCharLength
- hint      :  
  Tamanho total da barra de progresso (em caracteres).

["bar_max_char_length"]
O tema usado pode modificar este valor conforme as próprias regras.


&nbsp;

## int barAtualProgress

- aka       : --barAtualProgress
- default   : 0
- min       : 0
- max       : 100
- hint      :  
  Percentual atual de andamento do progresso (de 0 à 100).

["bar_atual_progress"]
Valores inválidos serão revertidos para "0".


&nbsp;

## int barAtualBarLength

- aka       : --barAtualBarLength
- hint      :  
  Tamanho total (em chars) que o componente da barra deve ter.

["bar_atual_bar_length"]
Quase todos os temas vão controlar este valor internamente. Trata-se do cálculo 
do tamanho total (em chars) que o componente da barra deve ter para representar 
o percentual de progresso atual.


&nbsp;

## string barColor

- aka       : --barColor
- hint      :  
  Código da cor que deve ser usada neste componente.

["bar_color"]


&nbsp;

## string barColorAlt

- aka       : --barColorAlt
- hint      :  
  Código da cor alternativa para este componente.

["bar_color_alt"]
Configuração de uma cor alternativa à cor principal.

Conforme as meta configurações o tema pode usar uma cor definida como 
alternativa para a mensagem.


&nbsp;

## bool barColorize

- aka       : --barColorize
- default   : 1
- hint      :  
  Indica se as cores devem ser aplicadas a este componente.

["bar_colorize"]
Permite alternar entre uma versão com ou sem cores para este componente.





&nbsp;

## bool infoShow

- aka       : --infoShow
- default   : 0
- hint      :  
  Indica se este componente deve ser mostrado ou omitido.

["info_show"]


&nbsp;

## char infoAlign

- aka       : --infoAlign
- default   : r
- options   :
  - r: right
  - l: left
- hint      :  
  Posicionamento da área informativa em relação à barra de progresso.

["info_align"]





&nbsp;

## string infoIniString

- aka       : --infoIniString
- hint      :  
  Caracteres que demarcam o início da área informativa.

["info_ini_string"]
Deixe vazio para não usar.


&nbsp;

## string infoEndString

- aka       : --infoEndString
- hint      :  
  Caracteres que demarcam o fim da área informativa.

["info_end_string"]
Deixe vazio para não usar.


&nbsp;

## bool infoUsePercent

- aka       : --infoUsePercent
- default   : 0
- hint      :  
  Indique `true` para usar o percentual atual para preencher a área informativa.

["info_use_percent"]


&nbsp;

## string infoData

- aka       : --infoData
- hint      :  
  Informação que deve ser usada para preencher a área informativa.

["info_data"]
Se o percentual de avanço for aparecer também, esta informação aparecerá após o 
mesmo.


&nbsp;

## string infoColor

- aka       : --infoColor
- hint      :  
  Código da cor que deve ser usada neste componente.

["info_color"]


&nbsp;

## string infoColorAlt

- aka       : --infoColorAlt
- hint      :  
  Código da cor alternativa para este componente.

["info_color_alt"]
Configuração de uma cor alternativa à cor principal.

Conforme as meta configurações o tema pode usar uma cor definida como 
alternativa para a mensagem.


&nbsp;

## bool infoColorize

- aka       : --infoColorize
- default   : 1
- hint      :  
  Indica se as cores devem ser aplicadas a este componente.

["info_colorize"]
Permite alternar entre uma versão com ou sem cores para este componente.





&nbsp;

# Returns void