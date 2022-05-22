#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Renderiza uma mensagem a ser mostrada para o usuário utilizando as
# configurações definidas no array associativo 'MSE_GLOBAL_SHOW_MESSAGE_CONFIG'.
#
# A composição da mensagem é estruturada em blocos, cada qual com
# características próprias mas com algumas características e funcionamento em
# comum.
#
# Os blocos são configurados na passagem de parametros na mesma ordem em que
# serão exibidos na tela. Abaixo há um esquema simples de como é - de forma
# geral - a estrutura usando todos os blocos.
#
# - Bloco 01: Separador superior da mensagem
# - Bloco 02: Título
# - Bloco 03: Corpo da mensagem
# - Bloco 04: Separador inferior da mensagem
#
#
#
# São esperadas as seguintes chaves de configuração:
#
# [MessageType]
# Tipo de mensagem.
#
#   Mensagens de Alerta
#
#   - ""        | ""  : Não definido (valor padrão).
#   - none      | n   : Não definido (mesmo que acima).
#   - info      | i   : Informação genérica.
#   - attention | a   : Atenção.
#   - warning   | w   : Alerta.
#   - error     | e   : Erro em uma operação.
#   - fail      | f   : Falha em uma operação.
#   - success   | s   : Sucesso em uma operação.
#
#
#   Mensagens de Prompt
#
#   - friendly  | fr  : Amigável. Questão sem muita importância.
#   - ordinary  | or  : Comum. Questão padrão.
#   - caution   | ca  : Cuidado. Questão que exige atenção do usuário ou que
#                       tenha potencial de alguma alteração permanente.
#   - important | im  : Importante. Questão com potencial de causar alteração
#                       permanente no processamento do script ou no próprio PC
#
# [MessageFormat]
# Formato.
# Pode ser um tipo específico de formatação definido no tema a ser usado ou
# o nome de uma função que possui uma formatação especial para a mensagem.
# Se não for definido, internamente usará o valor padrão 'FULLMESSAGE'.
#
#
#
# [MessageTopSeparator]
# Separador superior da mensagem.
#
# [MessageTopSeparatorColor]
# Indica se deve permitir a colorização do separador superior da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
#
# [TitleDisplay]
# Mostrar título.
# Use "0" para omitir.
# Use "1" para mostrar.
#
# [TitleType]
# Tipo do título.
#
# Abaixo segue uma lista dos tipos disponíveis para seleção.
# Na primeira linha está o código e uma breve descrição do tipo. Na linha
# imediatamente abaixo há um exemplo ddo respectivo modelo.
#
#   O código {ic_x} indica o início de uma área colorida.
#   No lugar do 'x' será usado um número que identifica uma cor.
#   O código {ec} indica o final da área colorida.
#
#   - 1   : Título simples (padrão)
#           {ic_1}Texto de título{ec}
#
#   - 2   : Título com 2 informações monocolor.
#           {ic_1}[ info_1 ] info_2{ec}
#           No texto do título cada uma das informações indicadas acima
#           devem vir separadas por '::'
#
#   - 3   : Título com 2 informações bicolor.
#           [ {ic_1}info_1{ec} ] {ic_2}info_2{ec}
#           No texto do título cada uma das informações indicadas acima
#           devem vir separadas por '::'
#
# A cor de cada área varia conforme o tema selecionado.
# Se o valor indicado não for válido, ou, se durante a formatação do título
# for identificada alguma inconsistência, reverterá o tipo do título para o
# valor padrão "1".
#
# [TitleTopSeparator]
# Separador superior do título.
#
# [TitleTopSeparatorColor]
# Indica se deve permitir a colorização do separador superior do título.
# Use "0" para não.
# Use "1" para sim.
#
# [TitleIndent]
# Indentação para o título.
# Use apenas espaços em branco.
# Deixe vazio para não usar.
#
# [TitleBullet]
# Bullet para o título.
# Deixe vazio para não usar.
#
# [TitleBulletColor]
# Indica se deve permitir a colorização do bullet do título.
# Use "0" para não.
# Use "1" para sim.
#
# [TitleText]
# Título da mensagem.
# Se "", usará o título padrão conforme o tipo de mensagem, ou, deixará a
# linha do título vazia em caso de tipo de mensagem "none".
#
# [TitleTextColor]
# Indica se deve permitir a colorização do título.
# Use "0" para não.
# Use "1" para sim.
#
# [TitleBottomSeparator]
# Separador inferior do título.
#
# [TitleBottomSeparatorColor]
# Indica se deve permitir a colorização do separador inferior do título.
# Use "0" para não.
# Use "1" para sim.
#
#
#
# [BodyMessageDisplay]
# Mostrar o corpo da mensagem.
# Use "0" para omitir.
# Use "1" para mostrar.
#
#
# [BodyMessageTopSeparator]
# Separador superior do corpo da mensagem.
#
# [BodyMessageTopSeparatorColor]
# Indica se deve permitir a colorização do separador superior corpo da
# mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
# [BodyMessageFirstLineIndent]
# Indentação para a primeira linha do corpo da mensagem.
# Use apenas espaços em branco.
# Deixe vazio para não usar.
#
# [BodyMessageFirstLineBullet]
# Bullet para a primeira linha do corpo da mensagem.
# Deixe vazio para não usar.
#
# [BodyMessageFirstLineBulletColor]
# Indica se deve ou não permitir a colorização do bullet da primeira linha do
# corpo da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
# [BodyMessageAnotherLinesIndent]
# Indentação para a segunda linha em diante do corpo da mensagem.
# Use apenas espaços em branco.
# Deixe vazio para não usar.
#
# [BodyMessageAnotherLinesBullet]
# Bullet para a segunda linha em diante do corpo da mensagem.
# Deixe vazio para não usar.
#
# [BodyMessageAnotherLinesBulletColor]
# Indica se deve ou não permitir a colorização do bullet da segunda linha em
# diante do corpo da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
# [BodyMessageArrayName]
# Nome de um array unidimensional em que estão as frases que devem ser
# usadas para montar o corpo da mensagem.
#
# [BodyMessageArrayNameColor]
# Indica se deve ou não permitir a colorização do corpo da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
# [BodyMessageBottomSeparator]
# Separador inferior do corpo da mensagem.
#
# [BodyMessageBottomSeparatorColor]
# Indica se deve permitir a colorização do separador inferior corpo da
# mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
#
# [MessageBottomSeparator]
# Separador inferior da mensagem.
#
# [MessageBottomSeparatorColor]
# Indica se deve permitir a colorização do separador inferior da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
#
# Observação:
# Quando uma função de tema é acionada ela deve carregar uma série de
# informações sobre cada cor que será usada em cada tipo de mensagem.
# As cores devem ser registradas em arrays associativos que correspondem a
# cada elemento capaz de receber colorização em cada um dos blocos que formam
# a mensagem como um todo.
# Abaixo segue uma lista contendo o nome de cada array associativo usado para
# tal finalidade.
#
# MSE_GSMCTC = MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_COLOR
#
# [Bloco 01: Separador superior da mensagem]
# - MSE_GSMCTC_B01_TOP_SEPARATOR
#
# [Bloco 02: Título]
# - MSE_GSMCTC_B02_TOP_SEPARATOR
# - MSE_GSMCTC_B02_BULLET
# - MSE_GSMCTC_B02_TEXT
# - MSE_GSMCTC_B02_BOTTOM_SEPARATOR
#
# [Bloco 03: Corpo da mensagem]
# - MSE_GSMCTC_B03_TOP_SEPARATOR
# - MSE_GSMCTC_B03_FIRST_LINE_BULLET
# - MSE_GSMCTC_B03_ANOTHER_LINES_BULLET
# - MSE_GSMCTC_B03_FIRST_LINE_TEXT
# - MSE_GSMCTC_B03_ANOTHER_LINES_TEXT
# - MSE_GSMCTC_B03_BOTTOM_SEPARATOR
#
# [Bloco 04: Separador inferior da mensagem]
# - MSE_GSMCTC_B04_BOTTOM_SEPARATOR
#
#
#
# @return
# Printa na tela as informações desejadas conforme configuração passada.
mse_inter_theme_default() {
  local mseMessageTitle
  local mseMessageBody


  #
  # Inicia a configuração das cores deste tema
  mse_inter_theme_default_setColorDefinition


  #
  # Padrão para as configurações das mensagens de tipo previsto
  case "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageFormat]}" in
    FULLMESSAGE)

      #
      # Configuração geral para uma mensagem padrão
      # Imprime todos os 4 blocos de uma mensagem.

      #
      # Bloco 01: Separador superior da mensagem
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageTopSeparator"]="\n"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageTopSeparatorColor"]="0"



      #
      # Bloco 02: Título
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleDisplay"]="1"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTopSeparator"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTopSeparatorColor"]="0"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleIndent"]="  "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBullet"]=":: "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBulletColor"]="0"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTextColor"]="1"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBottomSeparator"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBottomSeparatorColor"]="0"



      #
      # Bloco 03: Corpo da mensagem
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageDisplay"]="1"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageTopSeparator"]="\n"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageTopSeparatorColor"]="0"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageFirstLineIndent"]="     "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageFirstLineBullet"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageFirstLineBulletColor"]="0"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageAnotherLinesIndent"]="     "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageAnotherLinesBullet"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageAnotherLinesBulletColor"]="0"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageArrayNameColor"]="1"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageBottomSeparator"]="\n"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageBottomSeparatorColor"]="0"



      #
      # Bloco 04: Separador inferior da mensagem
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageBottomSeparator"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageBottomSeparatorColor"]="0"

    ;;

    SHOWSTATUS)

      #
      # Configuração geral para uma mensagem do tipo 'show status'
      #
      # Usa o tipo de título 3 para passar uma informação como resultado
      # de um processamento qualquer que pode indicar o aguardo do término
      # de um processo ou a realização com sucesso ou falha também.
      #
      # O cursor é interrompido imediatamente ao lado do final do título
      # permitindo que possa ser usado '\r' para retornar ao início da linha
      # e substituí-la se necessário, alterando assim o status printado na tela.
      #
      # Este tipo de mensagem NÃO conta com um corpo e nem utiliza espaços
      # acima ou abaixo da mensagem deixando este tipo de estilização para
      # o escopo do script que evocar a mensagem.

      #
      # Bloco 01: Separador superior da mensagem
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageTopSeparator"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageTopSeparatorColor"]="0"



      #
      # Bloco 02: Título
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleDisplay"]="1"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleType"]="3"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTopSeparator"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTopSeparatorColor"]="0"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleIndent"]="  "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBullet"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBulletColor"]="0"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTextColor"]="1"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBottomSeparator"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBottomSeparatorColor"]="0"



      #
      # Bloco 03: Corpo da mensagem
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageDisplay"]="0"



      #
      # Bloco 04: Separador inferior da mensagem
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageBottomSeparator"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageBottomSeparatorColor"]="0"

    ;;

    TITLE)

      #
      # Configuração geral para uma mensagem de título
      # Imprime apenas o bloco do título com espaçamento simples
      # acima e abaixo.

      #
      # Bloco 01: Separador superior da mensagem
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageTopSeparator"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageTopSeparatorColor"]="0"



      #
      # Bloco 02: Título
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleDisplay"]="1"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTopSeparator"]="\n"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTopSeparatorColor"]="0"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleIndent"]="  "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBullet"]=":: "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBulletColor"]="0"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTextColor"]="1"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBottomSeparator"]="\n"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBottomSeparatorColor"]="0"



      #
      # Bloco 03: Corpo da mensagem
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageDisplay"]="0"



      #
      # Bloco 04: Separador inferior da mensagem
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageBottomSeparator"]="\n"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageBottomSeparatorColor"]="0"

    ;;
  esac



  #
  # Gera a mensagem conforme o tipo selecionado
  mse_inter_showMessage_createSeparator "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageType]}" "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageTopSeparator]}" "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageTopSeparatorColor]}" "MSE_GSMCTC_B01_TOP_SEPARATOR"
  mse_inter_showMessage_createTitle
  mse_inter_showMessage_createBody
  mse_inter_showMessage_createSeparator "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageType]}" "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageBottomSeparator]}" "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageBottomSeparatorColor]}" "MSE_GSMCTC_B04_BOTTOM_SEPARATOR"
}





#
# Define as cores a serem usadas para este tema.
# Para isto, preenche os arrays associativos 'MSE_GSMCTC' descritos
# na documentação
mse_inter_theme_default_setColorDefinition() {


  #
  # Apenas se o tema não está carregado ...
  if [ -z ${MSE_GLOBAL_THEME_LOADED+x} ] || [ "${MSE_GLOBAL_THEME_LOADED}" == "" ] || [ "${MSE_GLOBAL_THEME_LOADED}" != "mse_inter_theme_default" ]; then

    #
    # Reseta todos os arrays associativos que estão correlacionados
    # as cores usadas nas mensagens

    #
    # [Bloco 01: Separador superior da mensagem]
    unset MSE_GSMCTC_B01_TOP_SEPARATOR
    declare -gA MSE_GSMCTC_B01_TOP_SEPARATOR

    #
    # [Bloco 02: Título]
    unset MSE_GSMCTC_B02_TOP_SEPARATOR
    unset MSE_GSMCTC_B02_BULLET
    unset MSE_GSMCTC_B02_TEXT
    unset MSE_GSMCTC_B02_BOTTOM_SEPARATOR

    declare -gA MSE_GSMCTC_B02_TOP_SEPARATOR
    declare -gA MSE_GSMCTC_B02_BULLET
    declare -gA MSE_GSMCTC_B02_TEXT
    declare -gA MSE_GSMCTC_B02_BOTTOM_SEPARATOR

    #
    # [Bloco 03: Corpo da mensagem]
    unset MSE_GSMCTC_B03_TOP_SEPARATOR
    unset MSE_GSMCTC_B03_FIRST_LINE_BULLET
    unset MSE_GSMCTC_B03_ANOTHER_LINES_BULLET
    unset MSE_GSMCTC_B03_FIRST_LINE_TEXT
    unset MSE_GSMCTC_B03_ANOTHER_LINES_TEXT
    unset MSE_GSMCTC_B03_BOTTOM_SEPARATOR

    declare -gA MSE_GSMCTC_B03_TOP_SEPARATOR
    declare -gA MSE_GSMCTC_B03_FIRST_LINE_BULLET
    declare -gA MSE_GSMCTC_B03_ANOTHER_LINES_BULLET
    declare -gA MSE_GSMCTC_B03_FIRST_LINE_TEXT
    declare -gA MSE_GSMCTC_B03_ANOTHER_LINES_TEXT
    declare -gA MSE_GSMCTC_B03_BOTTOM_SEPARATOR

    #
    # [Bloco 04: Separador inferior da mensagem]
    unset MSE_GSMCTC_B04_BOTTOM_SEPARATOR
    declare -gA MSE_GSMCTC_B04_BOTTOM_SEPARATOR





    #
    # Inicia um array associativo contendo a cor que cada tipo de mensagem deve usar.
    #
    # Note que toda cor definida para uso nos títulos possui uma variação "a1" que é
    # usada dentro da construção padrão.
    declare -A mseThemeColors

    #
    # Mensagens de Alerta
    mseThemeColors["info"]=$(mse_font_createStyle "0" "BOLD" "NONE" "DGREY" "1")
    mseThemeColors["info_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "DGREY" "1")

    mseThemeColors["attention"]=$(mse_font_createStyle "0" "BOLD" "NONE" "LBLUE" "1")
    mseThemeColors["attention_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "LBLUE" "1")

    mseThemeColors["warning"]=$(mse_font_createStyle "0" "BOLD" "NONE" "LYELLOW" "1")
    mseThemeColors["warning_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "LYELLOW" "1")

    mseThemeColors["error"]=$(mse_font_createStyle "0" "BOLD" "NONE" "RED" "1")
    mseThemeColors["error_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "RED" "1")

    mseThemeColors["fail"]=$(mse_font_createStyle "0" "BOLD" "NONE" "LRED" "1")
    mseThemeColors["fail_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "LRED" "1")

    mseThemeColors["success"]=$(mse_font_createStyle "0" "BOLD" "NONE" "GREEN" "1")
    mseThemeColors["success_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "GREEN" "1")


    #
    # Mensagens de Prompt
    mseThemeColors["friendly"]=$(mse_font_createStyle "0" "BOLD" "NONE" "LGREEN" "1")
    mseThemeColors["friendly_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "LGREEN" "1")

    mseThemeColors["ordinary"]=$(mse_font_createStyle "0" "BOLD" "NONE" "LBLUE" "1")
    mseThemeColors["ordinary_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "LBLUE" "1")

    mseThemeColors["caution"]=$(mse_font_createStyle "0" "BOLD" "NONE" "LYELLOW" "1")
    mseThemeColors["caution_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "LYELLOW" "1")

    mseThemeColors["important"]=$(mse_font_createStyle "0" "BOLD" "NONE" "LRED" "1")
    mseThemeColors["important_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "LRED" "1")


    #
    # Corpo de mensagems
    mseThemeColors["body"]=$(mse_font_createStyle "0" "BOLD" "NONE" "DGREY" "1")




    #
    # Carrega cada um dos arraya associativos com as informações
    # das cores
    local mseMessageType
    for mseMessageType in "${!mseThemeColors[@]}"; do
      #
      # [Bloco 01: Separador superior da mensagem]
      MSE_GSMCTC_B01_TOP_SEPARATOR[$mseMessageType]=${mseThemeColors[$mseMessageType]}

      #
      # [Bloco 02: Título]
      MSE_GSMCTC_B02_TOP_SEPARATOR[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B02_BULLET[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B02_TEXT[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B02_BOTTOM_SEPARATOR[$mseMessageType]=${mseThemeColors[$mseMessageType]}

      #
      # [Bloco 03: Corpo da mensagem]
      MSE_GSMCTC_B03_TOP_SEPARATOR[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B03_FIRST_LINE_BULLET[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B03_ANOTHER_LINES_BULLET[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B03_FIRST_LINE_TEXT[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B03_ANOTHER_LINES_TEXT[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B03_BOTTOM_SEPARATOR[$mseMessageType]=${mseThemeColors[$mseMessageType]}

      #
      # [Bloco 04: Separador inferior da mensagem]
      MSE_GSMCTC_B04_BOTTOM_SEPARATOR[$mseMessageType]=${mseThemeColors[$mseMessageType]}
    done



    #
    # Registra que este tema foi carregado
    declare -g MSE_GLOBAL_THEME_LOADED="mse_inter_theme_default"
  fi
}
