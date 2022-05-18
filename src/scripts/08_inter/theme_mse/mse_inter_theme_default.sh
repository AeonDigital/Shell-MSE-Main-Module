#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Renderiza uma mensagem a ser mostrada para o usuário utilizando as
# configurações definidas no array associativo 'MSE_GLOBAL_SHOW_MESSAGE_CONFIG'.
#
# São esperadas as seguintes chaves de configuração:
#
# [MessageType]
# Tipo de mensagem.
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
# [CustomSpecification]
# Configuração especial.
# Pode ser o nome de uma função que possui uma formatação especial para a
# mensagem ou um outro valor qualquer que pode ser usado para alguma definição
# especial do tema escolhido
#
#
#
# [DisplayTitle]
# Mostrar título.
# Use "0" para omitir o título.
# Use "1" para mostrar o título.
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
# [TopSeparatorTitle]
# Separador no topo do título.
# Use apenas "\n" caso queira apenas adicionar um ou mais espaços em branco.
# Outras opções são adicionar separadores gráficos como uma linha de "-" ou "="
# ou outro caracter de sua preferencia.
#
# [TopSeparatorTitleColor]
# Indica se deve ou não permitir a colorização do separador no topo.
# Use "0" para não.
# Use "1" para sim.
#
# [IndentTitle]
# Indentação para o título.
# Use apenas espaços em branco.
# Deixe vazio para não usar.
#
# [BulletTitle]
# Bullet para o título.
# Deixe vazio para não usar.
#
# [BulletTitleColor]
# Indica se deve ou não permitir a colorização do bullet do título.
# Use "0" para não.
# Use "1" para sim.
#
# [TextTitle]
# Título da mensagem.
# Se "", usará o título padrão conforme o tipo de mensagem, ou, deixará a linha
# do título vazia em caso de tipo de mensagem "none".
#
# [TextTitleColor]
# Indica se deve ou não permitir a colorização do título.
# Use "0" para não.
# Use "1" para sim.
#
# [BottomSeparatorTitle]
# Separador entre título e corpo da mensagem.
# Use apenas "\n" caso queira apenas adicionar um ou mais espaços em branco.
# Outras opções são adicionar separadores gráficos como uma linha de "-" ou "="
# ou outro caracter de sua preferencia.
#
# [BottomSeparatorTitleColor]
# Indica se deve ou não permitir a colorização do separador do título.
# Use "0" para não.
# Use "1" para sim.
#
#
#
# [DisplayBodyMessage]
# Mostrar o corpo da mensagem.
# Use "0" para omitir o corpo da mensagem.
# Use "1" para mostrar o corpo da mensagem.
#
# [IndentBodyMessageFirstLine]
# Indentação para a primeira linha do corpo da mensagem.
# Use apenas espaços em branco.
# Deixe vazio para não usar.
#
# [BulletBodyMessageFirstLine]
# Bullet para a primeira linha do corpo da mensagem.
# Deixe vazio para não usar.
#
# [BulletBodyMessageFirstLineColor]
# Indica se deve ou não permitir a colorização do bullet da primeira linha do
# corpo da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
# [IndentBodyMessageAnotherLines]
# Indentação para a segunda linha em diante do corpo da mensagem.
# Use apenas espaços em branco.
# Deixe vazio para não usar.
#
# [BulletBodyMessageAnotherLines]
# Bullet para a segunda linha em diante do corpo da mensagem.
# Deixe vazio para não usar.
#
# [BulletBodyMessageAnotherLinesColor]
# Indica se deve ou não permitir a colorização do bullet da segunda linha em
# diante do corpo da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
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
# [SeparatorBodyMessage]
# Separador entre o corpo da mensagem e a próxima linha do prompt do terminal.
# Use apenas "\n" caso queira apenas adicionar um ou mais espaços em branco.
# Outras opções são adicionar separadores gráficos como uma linha de "-" ou "="
# ou outro caracter de sua preferencia.
#
# [SeparatorBodyMessageColor]
# Indica se deve ou não permitir a colorização do separador do título.
# Use "0" para não.
# Use "1" para sim.
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
  if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[CustomSpecification]}" != "UTEST" ]; then
    if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[CustomSpecification]}" == "CHECK" ]; then
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["DisplayTitle"]="1"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TopSeparatorTitle"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TopSeparatorTitleColor"]="0"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["IndentTitle"]="  "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BulletTitle"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BulletTitleColor"]="0"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TextTitleColor"]="1"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BottomSeparatorTitle"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BottomSeparatorTitleColor"]="0"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["DisplayBodyMessage"]="0"
    else
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["DisplayTitle"]="1"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TopSeparatorTitle"]="\n"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TopSeparatorTitleColor"]="0"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["IndentTitle"]="  "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BulletTitle"]=":: "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BulletTitleColor"]="0"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TextTitleColor"]="1"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BottomSeparatorTitle"]="\n"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BottomSeparatorTitleColor"]="0"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["DisplayBodyMessage"]="1"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["IndentBodyMessageFirstLine"]="     "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BulletBodyMessageFirstLine"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BulletBodyMessageFirstLineColor"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["IndentBodyMessageAnotherLines"]="     "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BulletBodyMessageAnotherLines"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BulletBodyMessageAnotherLinesColor"]="0"

      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageArrayNameColor"]="1"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["SeparatorBodyMessage"]="\n\n"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["SeparatorBodyMessageColor"]="0"
    fi
  fi



  #
  # Gera a mensagem conforme o tipo selecionado
  mse_inter_showMessage_createTitle
  mse_inter_showMessage_createBody
}





#
# Define as cores a serem usadas para este tema.
mse_inter_theme_default_setColorDefinition() {
  local mseRedefineColors=0
  declare -a mseAssocArrays
  mseAssocArrays+=("MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLEBULLET_COLORS")
  mseAssocArrays+=("MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLETEXT_COLORS")
  mseAssocArrays+=("MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLESEPARATOR_COLORS")

  mseAssocArrays+=("MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYBULLET_FIRSTLINE_COLORS")
  mseAssocArrays+=("MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYTEXT_FIRSTLINE_COLORS")
  mseAssocArrays+=("MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYBULLET_ANOTHERLINES_COLORS")
  mseAssocArrays+=("MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYTEXT_ANOTHERLINES_COLORS")
  mseAssocArrays+=("MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYSEPARATOR_COLORS")


  local mseArrName
  for mseArrName in "${mseAssocArrays[@]}"; do
    if [ "${mseRedefineColors}" == 0 ] && [[ ! "$(declare -p $mseArrName 2> /dev/null)" =~ "declare -A" ]]; then
      mseRedefineColors=1
    fi
  done


  #
  # Apenas se as definições de cores ainda não foram definidas
  if [ "${mseRedefineColors}" == "1" ]; then
    local mseMessageType


    #
    # Note que para este tema as cores de cada uma das partes que compõe a mensagem são
    # sempre as mesmas, mas nada impediria de existir uma configuração diferente.
    declare -A mseThemeColors
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

    mseThemeColors["body"]=$(mse_font_createStyle "0" "BOLD" "NONE" "DGREY" "1")




    #
    # Cores para o bullet do título
    unset MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLEBULLET_COLORS
    declare -gA MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLEBULLET_COLORS
    for mseMessageType in "${!mseThemeColors[@]}"; do
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLEBULLET_COLORS[$mseMessageType]=${mseThemeColors[$mseMessageType]}
    done


    #
    # Cores para o texto do título
    unset MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLETEXT_COLORS
    declare -gA MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLETEXT_COLORS
    for mseMessageType in "${!mseThemeColors[@]}"; do
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLETEXT_COLORS[$mseMessageType]=${mseThemeColors[$mseMessageType]}
    done


    #
    # Cores para o separador do título
    unset MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLESEPARATOR_COLORS
    declare -gA MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLESEPARATOR_COLORS
    for mseMessageType in "${!mseThemeColors[@]}"; do
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLESEPARATOR_COLORS[$mseMessageType]=${mseThemeColors[$mseMessageType]}
    done





    #
    # Cores para o bullet da primeira linha do corpo da mensagem
    unset MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYBULLET_FIRSTLINE_COLORS
    declare -gA MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYBULLET_FIRSTLINE_COLORS
    for mseMessageType in "${!mseThemeColors[@]}"; do
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYBULLET_FIRSTLINE_COLORS[$mseMessageType]=${mseThemeColors[$mseMessageType]}
    done


    #
    # Cores para o texto da primeira linha do corpo da mensagem
    unset MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYTEXT_FIRSTLINE_COLORS
    declare -gA MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYTEXT_FIRSTLINE_COLORS
    for mseMessageType in "${!mseThemeColors[@]}"; do
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYTEXT_FIRSTLINE_COLORS[$mseMessageType]=${mseThemeColors[$mseMessageType]}
    done


    #
    # Cores para o bullet da segunda linha em diante do corpo da mensagem.
    unset MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYBULLET_ANOTHERLINES_COLORS
    declare -gA MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYBULLET_ANOTHERLINES_COLORS
    for mseMessageType in "${!mseThemeColors[@]}"; do
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYBULLET_ANOTHERLINES_COLORS[$mseMessageType]=${mseThemeColors[$mseMessageType]}
    done


    #
    # Cores para o texto da segunda linha em diante do corpo da mensagem.
    unset MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYTEXT_ANOTHERLINES_COLORS
    declare -gA MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYTEXT_ANOTHERLINES_COLORS
    for mseMessageType in "${!mseThemeColors[@]}"; do
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYTEXT_ANOTHERLINES_COLORS[$mseMessageType]=${mseThemeColors[$mseMessageType]}
    done


    #
    # Cores para o separador do corpo da mensagem.
    unset MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYSEPARATOR_COLORS
    declare -gA MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYSEPARATOR_COLORS
    for mseMessageType in "${!mseThemeColors[@]}"; do
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYSEPARATOR_COLORS[$mseMessageType]=${mseThemeColors[$mseMessageType]}
    done
  fi
}
