# Synopsis

Prepara um array associativo preenchendo as chaves necessárias para a execução 
de um comando **mse_inter_showMessage**.



&nbsp;

# Description

Se nenhum critério de configuração for passado, toda mensagem será definida 
pelo tema vigente.

A configuração é feita em cinco partes sendo cada uma delas responsável pelas 
configurações de uma área da mensagem.

A anatomia dos componentes das mensagens pode ser descrita da seguinte forma:

[[top_separator]]

  [[title_top_separator]]
    [[title_indent]] [[title_bullet]] [[title_string]] [[title_string_end]]
  [[title_bottom_separator]]

  [[body_top_separator]]
    [[body_first_line_indent]] [[body_first_line_bullet]] [[body_first_line]]
    [[body_lines_indent]] [[body_lines_bullet]] [[body_lines]]
  [[body_bottom_separator]]

[[ bottom_separator]]


&nbsp;

## Parte 01: Meta formatação

Aqui são definidas propriedades que afetam todas as demais partes do corpo da 
mensagem.
Chaves definidas nesta parte:

- meta_type
- meta_theme
- meta_format


&nbsp;

## Parte 02: Separador superior da mensagem

Permite definir um separador no topo da mensagem que será mostrada ao usuário.
Chaves definidas nesta parte:

- top_separator_string
- top_separator_color
- top_separator_color_alt
- top_separator_colorize


&nbsp;

## Parte 03: Título

Configura a forma como o título da mensagem será mostrada.  
Chaves definidas nesta parte:

- title_show
- title_type
- title_top_separator_string
- title_top_separator_color
- title_top_separator_color_alt
- title_top_separator_colorize
- title_indent
- title_bullet
- title_bullet_color
- title_bullet_color_alt
- title_bullet_colorize
- title_string
- title_string_color
- title_string_color_alt
- title_string_colorize
- title_string_end
- title_bottom_separator_string
- title_bottom_separator_color
- title_bottom_separator_color_alt
- title_bottom_separator_colorize


&nbsp;

## Parte 04: Corpo da mensagem
  
Configura a amostragem do corpo da mensagem.
Chaves definidas nesta parte:

- body_show
- body_top_separator_string
- body_top_separator_color
- body_top_separator_color_alt
- body_top_separator_colorize
- body_first_line_indent
- body_first_line_bullet
- body_first_line_bullet_color
- body_first_line_bullet_color_alt
- body_first_line_bullet_colorize
- body_lines_indent
- body_lines_bullet
- body_lines_bullet_color
- body_lines_bullet_color_alt
- body_lines_bullet_colorize
- body_lines
- body_lines_color
- body_lines_color_alt
- body_lines_colorize
- body_bottom_separator_string
- body_bottom_separator_color
- body_bottom_separator_color_alt
- body_bottom_separator_colorize


&nbsp;

## Parte 05: Separador inferior da mensagem

Permite definir um separador abaixo da mensagem que será mostrada ao usuário.
Chaves definidas nesta parte:

- bottom_separator_string
- bottom_separator_color
- bottom_separator_color_alt
- bottom_separator_colorize



&nbsp;

# Parameters

## string arrayName

- aka       : -a --arrayName
- hint      :  
  Nome do array associativo que será preenchido.


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

["meta_type"]
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

## string theme

- aka       : --theme
- hint      :  
  Nome do tema a ser usado para gerar a mensagem.

["meta_theme"]
As configurações do tema sobrescreverão quaisquer outras configurações 
definidas nesta função.


&nbsp;

## string format

- aka       : --format
- hint      :  
  Estilo do formato de apresentação da mensagem (conforme disponível pelo 
  tema).

["meta_format"]
Cada tema pode fornecer vários formatos de mensagem, se for o caso, neste
parametro deve ser indicado qual deve ser usado. De outra forma o formato 
padrão será utilizado.





&nbsp;

## string topSeparatorString

- aka       : --topSeparatorString
- hint      :  
  String usada para este separador.

["top_separator_string"]
Pode ser apenas um caracter de nova linha (\n) ou um outro qualquer que será 
exibido como separador.

Se nenhum caracter for definido este componente será omitido totalmente.


&nbsp;

## string topSeparatorColor

- aka       : --topSeparatorColor
- hint      :  
  Código da cor que deve ser usada neste componente.

["top_separator_color"]
Esta configuração apenas faz sentido se um caracter de separação for definido e 
se ele for visível.


&nbsp;

## string topSeparatorColorAlt

- aka       : --topSeparatorColorAlt
- hint      :  
  Código da cor alternativa para este componente.

["top_separator_color_alt"]
Configuração de uma cor alternativa à cor principal.

Conforme as meta configurações o tema pode usar uma cor definida como 
alternativa para a mensagem.


&nbsp;

## bool topSeparatorColorize

- aka       : --topSeparatorColorize
- default   : 1
- hint      :  
  Indica se as cores devem ser aplicadas a este componente.

["top_separator_colorize"]
Permite alternar entre uma versão com ou sem cores para este componente.





&nbsp;

## bool titleShow

- aka       : --titleShow
- default   : 1
- hint      :  
  Indica se este componente deve ser mostrado ou omitido.

["title_show"]


&nbsp;

## bool titleType

- aka       : --titleType
- hint      :  
  Indica o tipo de título que deve ser mostrado (varia conforme o tema).

["title_type"]
Os temas podem fornecer tipos diferentes de titulos podendo alterar sua forma 
de apresentação.

Se nada for especificado para esta propriedade será usado o valor padrão 
definido pelo tema sendo usado.





&nbsp;

## bool titleTopSeparatorString

- aka       : --titleTopSeparatorString
- hint      :  
  String usada para este separador.

["title_top_separator_string"]
Pode ser apenas um caracter de nova linha (\n) ou um outro qualquer que será 
exibido como separador.

Se nenhum caracter for definido este componente será omitido totalmente.


&nbsp;

## string titleTopSeparatorColor

- aka       : --titleTopSeparatorColor
- hint      :  
  Código da cor que deve ser usada neste componente.

["title_top_separator_color"]
Esta configuração apenas faz sentido se um caracter de separação for definido e 
se ele for visível.


&nbsp;

## string titleTopSeparatorColorAlt

- aka       : --titleTopSeparatorColorAlt
- hint      :  
  Código da cor alternativa para este componente.

["title_top_separator_color_alt"]
Configuração de uma cor alternativa à cor principal.

Conforme as meta configurações o tema pode usar uma cor definida como 
alternativa para a mensagem.


&nbsp;

## bool titleTopSeparatorColorize

- aka       : --titleTopSeparatorColorize
- default   : 1
- hint      :  
  Indica se as cores devem ser aplicadas a este componente.

["title_top_separator_colorize"]
Permite alternar entre uma versão com ou sem cores para este componente.





&nbsp;

## string titleIndent

- aka       : --titleIndent
- hint      :  
  Indentação para o título.

["title_indent"]
Use apenas espaços em branco.
Se nenhum caracter for definido este componente será omitido totalmente.





&nbsp;

## bool titleBullet

- aka       : --titleBullet
- hint      :  
  String usada para o bullet.

["title_bullet"]
String usada para o bullet.
Se nenhum caracter for definido este componente será omitido totalmente.


&nbsp;

## string titleBulletColor

- aka       : --titleBulletColor
- hint      :  
  Código da cor que deve ser usada neste componente.

["title_bullet_color"]
Código da cor que deve ser usada neste componente.


&nbsp;

## string titleBulletColorAlt

- aka       : --titleBulletColorAlt
- hint      :  
  Código da cor alternativa para este componente.

["title_bullet_color_alt"]
Configuração de uma cor alternativa à cor principal.

Conforme as meta configurações o tema pode usar uma cor definida como 
alternativa para a mensagem.


&nbsp;

## bool titleBulletColorize

- aka       : --titleBulletColorize
- default   : 1
- hint      :  
  Indica se as cores devem ser aplicadas a este componente.

["title_bullet_colorize"]
Permite alternar entre uma versão com ou sem cores para este componente.





&nbsp;

## string titleString

- aka       : --titleString
- hint      :  
  Título da mensagem.

["title_string"]
Se "", usará o título padrão conforme o `type` de mensagem, ou, deixará a
linha do título vazia em caso de tipo de mensagem `none`.


&nbsp;

## string titleStringColor

- aka       : --titleStringColor
- hint      :  
  Código da cor que deve ser usada neste componente.

["title_string_color"]
Código da cor que deve ser usada neste componente.


&nbsp;

## string titleStringColorAlt

- aka       : --titleStringColorAlt
- hint      :  
  Código da cor alternativa para este componente.

["title_string_color_alt"]
Configuração de uma cor alternativa à cor principal.

Conforme as meta configurações o tema pode usar uma cor definida como 
alternativa para a mensagem.


&nbsp;

## bool titleStringColorize

- aka       : --titleStringColorize
- default   : 1
- hint      :  
  Indica se as cores devem ser aplicadas a este componente.

["title_string_colorize"]
Permite alternar entre uma versão com ou sem cores para este componente.





&nbsp;

## string titleStringEnd

- aka       : --titleStringEnd
- hint      :  
  String usada ao final da linha de texto do título.

["title_string_end"]
Normalmente, se usada, será definido como um caracter `\n` para forçar a quebra 
de linha antes de iniciar o próximo componente.





&nbsp;

## bool titleBottomSeparatorString

- aka       : --titleBottomSeparatorString
- hint      :  
  String usada para este separador.

["title_bottom_separator_string"]
Pode ser apenas um caracter de nova linha (\n) ou um outro qualquer que será 
exibido como separador.

Se nenhum caracter for definido este componente será omitido totalmente.


&nbsp;

## string titleBottomSeparatorColor

- aka       : --titleBottomSeparatorColor
- hint      :  
  Código da cor que deve ser usada neste componente.

["title_bottom_separator_color"]
Esta configuração apenas faz sentido se um caracter de separação for definido e 
se ele for visível.


&nbsp;

## string titleBottomSeparatorColorAlt

- aka       : --titleBottomSeparatorColorAlt
- hint      :  
  Código da cor alternativa para este componente.

["title_bottom_separator_color_alt"]
Configuração de uma cor alternativa à cor principal.

Conforme as meta configurações o tema pode usar uma cor definida como 
alternativa para a mensagem.


&nbsp;

## bool titleBottomSeparatorColorize

- aka       : --titleBottomSeparatorColorize
- default   : 1
- hint      :  
  Indica se as cores devem ser aplicadas a este componente.

["title_bottom_separator_colorize"]
Permite alternar entre uma versão com ou sem cores para este componente.





&nbsp;

## bool bodyShow

- aka       : --bodyShow
- default   : 1
- hint      :  
  Indica se este componente deve ser mostrado ou omitido.

["body_show"]





&nbsp;

## bool bodyTopSeparatorString

- aka       : --bodyTopSeparatorString
- hint      :  
  String usada para este separador.

["body_top_separator_string"]
Pode ser apenas um caracter de nova linha (\n) ou um outro qualquer que será 
exibido como separador.

Se nenhum caracter for definido este componente será omitido totalmente.


&nbsp;

## string bodyTopSeparatorColor

- aka       : --bodyTopSeparatorColor
- hint      :  
  Código da cor que deve ser usada neste componente.

["body_top_separator_color"]
Esta configuração apenas faz sentido se um caracter de separação for definido e 
se ele for visível.


&nbsp;

## string bodyTopSeparatorColorAlt

- aka       : --bodyTopSeparatorColorAlt
- hint      :  
  Código da cor alternativa para este componente.

["body_top_separator_color_alt"]
Configuração de uma cor alternativa à cor principal.

Conforme as meta configurações o tema pode usar uma cor definida como 
alternativa para a mensagem.


&nbsp;

## bool bodyTopSeparatorColorize

- aka       : --bodyTopSeparatorColorize
- default   : 1
- hint      :  
  Indica se as cores devem ser aplicadas a este componente.

["body_top_separator_colorize"]
Permite alternar entre uma versão com ou sem cores para este componente.





&nbsp;

## string bodyFirstLineIndent

- aka       : --bodyFirstLineIndent
- hint      :  
  Indentação para o título.

["body_first_line_indent"]
Use apenas espaços em branco.
Se nenhum caracter for definido este componente será omitido totalmente.





&nbsp;

## bool bodyFirstLineBullet

- aka       : --bodyFirstLineBullet
- hint      :  
  String usada para o bullet.

["body_first_line_bullet"]
String usada para o bullet.
Se nenhum caracter for definido este componente será omitido totalmente.


&nbsp;

## string bodyFirstLineBulletColor

- aka       : --bodyFirstLineBulletColor
- hint      :  
  Código da cor que deve ser usada neste componente.

["body_first_line_bullet_color"]
Código da cor que deve ser usada neste componente.


&nbsp;

## string bodyFirstLineBulletColorAlt

- aka       : --bodyFirstLineBulletColorAlt
- hint      :  
  Código da cor alternativa para este componente.

["body_first_line_bullet_color_alt"]
Configuração de uma cor alternativa à cor principal.

Conforme as meta configurações o tema pode usar uma cor definida como 
alternativa para a mensagem.


&nbsp;

## bool bodyFirstLineBulletColorize

- aka       : --bodyFirstLineBulletColorize
- default   : 1
- hint      :  
  Indica se as cores devem ser aplicadas a este componente.

["body_first_line_bullet_colorize"]
Permite alternar entre uma versão com ou sem cores para este componente.





&nbsp;

## string bodyLinesIndent

- aka       : --bodyLinesIndent
- hint      :  
  Indentação para as linhas da mensagem.

["body_lines_indent"]
Use apenas espaços em branco.
Se nenhum caracter for definido este componente será omitido totalmente.





&nbsp;

## bool bodyLinesBullet

- aka       : --bodyLinesBullet
- hint      :  
  String usada para o bullet.

["body_lines_bullet"]
String usada para o bullet.
Se nenhum caracter for definido este componente será omitido totalmente.


&nbsp;

## string bodyLinesBulletColor

- aka       : --bodyLinesBulletColor
- hint      :  
  Código da cor que deve ser usada neste componente.

["body_lines_bullet_color"]
Código da cor que deve ser usada neste componente.


&nbsp;

## string bodyLinesBulletColorAlt

- aka       : --bodyLinesBulletColorAlt
- hint      :  
  Código da cor alternativa para este componente.

["body_lines_bullet_color_alt"]
Configuração de uma cor alternativa à cor principal.

Conforme as meta configurações o tema pode usar uma cor definida como 
alternativa para a mensagem.


&nbsp;

## bool bodyLinesBulletColorize

- aka       : --bodyLinesBulletColorize
- default   : 1
- hint      :  
  Indica se as cores devem ser aplicadas a este componente.

["body_lines_bullet_colorize"]
Permite alternar entre uma versão com ou sem cores para este componente.





&nbsp;

## array bodyLines

- aka       : --bodyLines
- hint      :  
  Nome do array que trás as linhas de dados a serem apresentadas.

["body_lines"]


&nbsp;

## string bodyLinesColor

- aka       : --bodyLinesColor
- hint      :  
  Código da cor que deve ser usada neste componente.

["body_lines_color"]
Código da cor que deve ser usada neste componente.


&nbsp;

## string bodyLinesColorAlt

- aka       : --bodyLinesColorAlt
- hint      :  
  Código da cor alternativa para este componente.

["body_lines_color_alt"]
Configuração de uma cor alternativa à cor principal.

Conforme as meta configurações o tema pode usar uma cor definida como 
alternativa para a mensagem.


&nbsp;

## bool bodyLinesColorize

- aka       : --bodyLinesColorize
- default   : 1
- hint      :  
  Indica se as cores devem ser aplicadas a este componente.

["body_lines_colorize"]
Permite alternar entre uma versão com ou sem cores para este componente.





&nbsp;

## bool bodyBottomSeparatorString

- aka       : --bodyBottomSeparatorString
- hint      :  
  String usada para este separador.

["body_bottom_separator_string"]
Pode ser apenas um caracter de nova linha (\n) ou um outro qualquer que será 
exibido como separador.

Se nenhum caracter for definido este componente será omitido totalmente.


&nbsp;

## string bodyBottomSeparatorColor

- aka       : --bodyBottomSeparatorColor
- hint      :  
  Código da cor que deve ser usada neste componente.

["body_bottom_separator_color"]
Esta configuração apenas faz sentido se um caracter de separação for definido e 
se ele for visível.


&nbsp;

## string bodyBottomSeparatorColorAlt

- aka       : --bodyBottomSeparatorColorAlt
- hint      :  
  Código da cor alternativa para este componente.

["body_bottom_separator_color_alt"]
Configuração de uma cor alternativa à cor principal.

Conforme as meta configurações o tema pode usar uma cor definida como 
alternativa para a mensagem.


&nbsp;

## bool bodyBottomSeparatorColorize

- aka       : --bodyBottomSeparatorColorize
- default   : 1
- hint      :  
  Indica se as cores devem ser aplicadas a este componente.

["body_bottom_separator_colorize"]
Permite alternar entre uma versão com ou sem cores para este componente.





&nbsp;

## string bottomSeparatorString

- aka       : --bottomSeparatorString
- hint      :  
  String usada para este separador.

["bottom_separator_string"]
Pode ser apenas um caracter de nova linha (\n) ou um outro qualquer que será 
exibido como separador.

Se nenhum caracter for definido este componente será omitido totalmente.


&nbsp;

## string bottomSeparatorColor

- aka       : --bottomSeparatorColor
- hint      :  
  Código da cor que deve ser usada neste componente.

["bottom_separator_color"]
Esta configuração apenas faz sentido se um caracter de separação for definido e 
se ele for visível.


&nbsp;

## string bottomSeparatorColorAlt

- aka       : --bottomSeparatorColorAlt
- hint      :  
  Código da cor alternativa para este componente.

["bottom_separator_color_alt"]
Configuração de uma cor alternativa à cor principal.

Conforme as meta configurações o tema pode usar uma cor definida como 
alternativa para a mensagem.


&nbsp;

## bool bottomSeparatorColorize

- aka       : --bottomSeparatorColorize
- default   : 1
- hint      :  
  Indica se as cores devem ser aplicadas a este componente.

["bottom_separator_colorize"]
Permite alternar entre uma versão com ou sem cores para este componente.





&nbsp;

# Returns void