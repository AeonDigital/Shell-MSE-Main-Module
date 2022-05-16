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
# [CustomMessageGenerator]
# Nome de uma função que possui uma formatação especial para a mensagem.
# Se for passado um valor inválido, a função padrão será evocada.
#
#
#
# [DisplayTitle]
# Mostrar título.
# Use "0" para omitir o título.
# Use "1" para mostrar o título.
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
  if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[CustomMessageGenerator]}" != "UTEST" ]; then
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



  #
  # Gera a mensagem conforme o tipo selecionado
  case "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[CustomMessageGenerator]}" in
    mse_inter_theme_default_title_alt_1)
      mse_inter_theme_default_title_alt_1_render
      mse_inter_showMessage_createBody
    ;;
    *)
      mse_inter_showMessage_createTitle
      mse_inter_showMessage_createBody
    ;;
  esac

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
    mseThemeColors["info"]=$(mse_font_createStyle "DGREY" "NONE" "BOLD")
    mseThemeColors["attention"]=$(mse_font_createStyle "LBLUE" "NONE" "BOLD")
    mseThemeColors["warning"]=$(mse_font_createStyle "LYELLOW" "NONE" "BOLD")
    mseThemeColors["error"]=$(mse_font_createStyle "RED" "NONE" "BOLD")
    mseThemeColors["fail"]=$(mse_font_createStyle "LRED" "NONE" "BOLD")
    mseThemeColors["success"]=$(mse_font_createStyle "GREEN" "NONE" "BOLD")

    mseThemeColors["body"]=$(mse_font_createStyle "DGREY" "NONE" "BOLD")




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





#
# Wrapper para a função principal geradora da mensagem.
mse_inter_theme_default_title_alt_1() {
  mse_inter_theme_default
}
#
# Monta toda a parte do título da mensagem conforme as configurações
# definidas e o tema utilizado
mse_inter_theme_default_title_alt_1_render() {
  local mseReturn
  local mseTitleText
  local mseTitleType
  local mseTextTitleParts


  if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[DisplayTitle]}" == "0" ]; then
    mseReturn=""
  else
    mseTitleType="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageType]}"


    #
    # Conforme o tipo da mensagem
    case "${mseTitleType}" in
      none | n)
        mseTitleText=""
      ;;
      info | i)
        mseTitleText="${lbl_inter_alert_header_info}"
      ;;
      attention | a)
        mseTitleText="${lbl_inter_alert_header_attention}"
      ;;
      warning | w)
        mseTitleText="${lbl_inter_alert_header_warning}"
      ;;
      error | e)
        mseTitleText="${lbl_inter_alert_header_error}"
      ;;
      fail | f)
        mseTitleText="${lbl_inter_alert_header_fail}"
      ;;
      success | s)
        mseTitleText="${lbl_inter_alert_header_success}"
      ;;
      *)
        mseTitleText="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageType]}"
      ;;
    esac


    #
    # Monta a linha do título parte a parte
    #
    # Parte 1 : Separador do topo
    if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TopSeparatorTitle]}" != "" ]; then
      if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TopSeparatorTitleColor]}" == "1" ]; then
        mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLESEPARATOR_COLORS[${mseTitleType}]}"
      fi

      mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TopSeparatorTitle]}"

      if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TopSeparatorTitleColor]}" == "1" ]; then
        mseReturn+="${mseNONE}"
      fi
    fi


    #
    # Parte 2 : Indentação
    mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[IndentTitle]}"


    #
    # Parte 3 : Bullet
    if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BulletTitle]}" != "" ]; then
      if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BulletTitleColor]}" == "1" ]; then
        mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLEBULLET_COLORS[${mseTitleType}]}"
      fi

      mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BulletTitle]}"

      if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BulletTitleColor]}" == "1" ]; then
        mseReturn+="${mseNONE}"
      fi
    fi


    #
    # Parte 4 : Texto
    #
    # Splita os valores passados no 'TextTitle' original
    local mseUseColor=""
    local mseUseAltColor=""
    if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TextTitleColor]}" == "1" ]; then
      mseUseColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLETEXT_COLORS[${mseTitleType}]}"
      mseUseAltColor="\e[2;37;91m"
    fi

    mse_str_split "::" "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TextTitle]}"
    mseTextTitleParts="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"

    if [ "${mseTextTitleParts}" -le "1" ]; then
      mseReturn+="[ ${mseUseAltColor}script${mseNONE} ] ${mseUseColor}${mseTitleText}${mseNONE}"
    elif [ "${mseTextTitleParts}" == "2" ]; then
      mseReturn+="[ ${mseUseAltColor}${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}${mseNONE} ] ${mseUseColor}${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]:1}${mseNONE}"
    else
      mseReturn+="${mseUseColor}${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TextTitle]}${mseNONE}"
    fi


    #
    # Parte 5 : Separador
    if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BottomSeparatorTitle]}" != "" ]; then
      if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BottomSeparatorTitleColor]}" == "1" ]; then
        mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLESEPARATOR_COLORS[${mseTitleType}]}"
      fi

      mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BottomSeparatorTitle]}"

      if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BottomSeparatorTitleColor]}" == "1" ]; then
        mseReturn+="${mseNONE}"
      fi
    fi
  fi


  printf "${mseReturn}"
}
