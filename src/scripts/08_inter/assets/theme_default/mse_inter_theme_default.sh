#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Valida o valor "meta_format" indicado. Sendo válido, retorna ele próprio.
# Sendo inválido, retorna o valor padrão.
#
# @param string $1
# Valor que está sendo testado
#
# @return
# Valor "meta_format" válido para este tema
mse_inter_theme_default_checkMetaFormat() {
  declare -a mseAllowedMetaFormat=("free" "default" "status" "title")

  local mseReturn="${1}"
  if [[ ! "${mseAllowedMetaFormat[*]}" =~ "${mseReturn}" ]]; then
    mseReturn="default"
  fi

  printf "${mseReturn}"
}










#
# @desc
# Seta no array associativo global "MSE_GLOBAL_MAIN_THEME_COLORS" todas as
# definições de cores usadas por este tema.
#
#
# As chaves que identificam cada cor a ser usada é definida a partir de uma
# composição dos seguintes itens:
#
# - 01: Prefixo identificador do tema
#
# - 02: Identificador da função para a qual a definição se destina
#       message   : mse_inter_showMessage
#       prompt    : mse_inter_promptUser
#       progress  : mse_inter_showProgressBar
#       spinner   : mse_inter_startSpinner
#       man       : mse_mmod_man
#       metadata  : mse_mmod_showMetaData
#
# - 03: Subtipo/tom de mensagem/informação
#       Uso opcional.
#       Usado quando a informação gerada pela função alvo pode ser definida
#       como de um certo tipo, geralmente indicando o "tom" da mensagem.
#       Ex: As funções "mse_inter_showMessage" e "mse_inter_promptUser".
#
# - 04: Componente
#       Nome do componente ao qual se destina a cor.
#
# - 05: Variação
#       Toda cor pode oferecer uma ou mais versões alternativas, cada uma
#       é identificada pelo sufixo "alt".
mse_inter_theme_default_setColors() {
  #
  # Apenas se este tema não foi carregado
  if [ -z "${MSE_GLOBAL_MAIN_THEME_COLORS[mse_inter_theme_default]+x}" ]; then
    #
    # Definição básica para as cores deste tema
    local msePrefix="itd"

    declare -A mseToneArr

    mseToneArr["none"]=""
    mseToneArr["none_alt"]=""

    mseToneArr["info"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LBLACK" "1")
    mseToneArr["info_alt"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LBLACK" "1")
    mseToneArr["attention"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LBLUE" "1")
    mseToneArr["attention_alt"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LBLUE" "1")
    mseToneArr["warning"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LYELLOW" "1")
    mseToneArr["warning_alt"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LYELLOW" "1")
    mseToneArr["error"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LRED" "1")
    mseToneArr["error_alt"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LRED" "1")
    mseToneArr["fail"]=$(mse_font_createStyle "4" "BOLD" "NONE" "RED" "1")
    mseToneArr["fail_alt"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "RED" "1")
    mseToneArr["success"]=$(mse_font_createStyle "4" "BOLD" "NONE" "GREEN" "1")
    mseToneArr["success_alt"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "GREEN" "1")

    mseToneArr["body"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LBLACK" "1")
    mseToneArr["body_alt"]=$(mse_font_createStyle "4" "BOLD" "NONE" "WHITE" "1")

    mseToneArr["ordinary"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LBLUE" "1")
    mseToneArr["ordinary_alt"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LBLUE" "1")
    mseToneArr["friendly"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LGREEN" "1")
    mseToneArr["friendly_alt"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LGREEN" "1")
    mseToneArr["caution"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LYELLOW" "1")
    mseToneArr["caution_alt"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LYELLOW" "1")
    mseToneArr["important"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LRED" "1")
    mseToneArr["important_alt"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LRED" "1")



    #
    # Use o array associativo abaixo da seguinte forma:
    # - em cada chave, identifique a função que está sendo configurada.
    # - no valor correspondente, indique os componentes que podem ser colorizados.
    #   para casos em que nenhum componente deva ser colorizado use o valor "main"
    declare -A mseArrFunctionComponents
    #
    # Para a função "showMessage", apenas o título é colorizado em multitons
    mseArrFunctionComponents["message"]="title_string"



    #
    # Use o array associativo abaixo da seguinte forma:
    # - em cada chave, identifique a função que está sendo configurada.
    # - no valor correspondente, indique os "tons" que são usados
    #   para casos em que nenhum "tom" deva ser usado, use apenas o valor "none"
    declare -A mseArrFunctionTones
    mseArrFunctionTones["message"]="none info attention warning error fail success ordinary friendly caution important"



    local mseFunctionId=""
    declare -a mseTmpComponentsArr=()
    declare -a mseTmpToneArr=()
    local mseTmpComponent=""
    local mseTmpTone=""
    local mseTmpColorId=""


    for mseFunctionId in "${!mseArrFunctionComponents[@]}"; do
      mseTmpComponentsArr=(${mseArrFunctionComponents[$mseFunctionId]})
      mseTmpToneArr=(${mseArrFunctionTones[$mseFunctionId]})

      for mseTmpComponent in "${mseTmpComponentsArr[@]}"; do
        for mseTmpTone in "${mseTmpToneArr[@]}"; do
          mseTmpColorId="${msePrefix}_${mseFunctionId}_${mseTmpComponent}_${mseTmpTone}"

          MSE_GLOBAL_MAIN_THEME_COLORS["${mseTmpColorId}"]="${mseToneArr[${mseTmpTone}]}"
          MSE_GLOBAL_MAIN_THEME_COLORS["${mseTmpColorId}_alt"]="${mseToneArr[${mseTmpTone}_alt]}"
        done
      done
    done


    MSE_GLOBAL_MAIN_THEME_COLORS["itd_message_body"]="${mseToneArr[body]}"
    MSE_GLOBAL_MAIN_THEME_COLORS["itd_message_body_alt"]="${mseToneArr[body_alt]}"

    #
    # Registra o prefixo usado para identificar as configurações deste tema
    MSE_GLOBAL_MAIN_THEME_COLORS["mse_inter_theme_default"]="itd"
  fi
}










#
# @desc
# Finaliza o preparo de um array associativo aplicando as configurações
# próprias deste tema.
#
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# mensagem.
#
# Para configurar este array associativo use a função "mse_inter_prepareMessage".
mse_inter_theme_default_prepareMessage() {
  mse_inter_theme_default_setColors

  declare -n mseTmpArrThemePrepareMessage="${1}"
  local mseMessageType="${mseTmpArrThemePrepareMessage[meta_type]}"


  #
  # Padrão para as configurações das mensagens de tipo previsto
  case "${mseTmpArrThemePrepareMessage[meta_format]}" in
    free)

      #
      # Permite uma configuração livre do componente
      mseTmpArrThemePrepareMessage["meta_format"]="free"

    ;;

    default)

      #
      # Configuração geral para uma mensagem padrão
      # Imprime todos os 4 blocos de uma mensagem.

      #
      # Bloco 02: Separador superior da mensagem
      mseTmpArrThemePrepareMessage["top_separator_string"]="\n"
      mseTmpArrThemePrepareMessage["top_separator_color"]=""
      mseTmpArrThemePrepareMessage["top_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["top_separator_colorize"]="0"



      #
      # Bloco 03: Título
      mseTmpArrThemePrepareMessage["title_show"]="1"

      mseTmpArrThemePrepareMessage["title_top_separator_string"]=""
      mseTmpArrThemePrepareMessage["title_top_separator_color"]=""
      mseTmpArrThemePrepareMessage["title_top_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["title_top_separator_colorize"]="0"

      mseTmpArrThemePrepareMessage["title_indent"]="  "

      mseTmpArrThemePrepareMessage["title_bullet"]=":: "
      mseTmpArrThemePrepareMessage["title_bullet_color"]=""
      mseTmpArrThemePrepareMessage["title_bullet_color_alt"]=""
      mseTmpArrThemePrepareMessage["title_bullet_colorize"]="0"

      mseTmpArrThemePrepareMessage["title_string_color"]="${MSE_GLOBAL_MAIN_THEME_COLORS[itd_message_title_string_${mseMessageType}]}"
      mseTmpArrThemePrepareMessage["title_string_color_alt"]="${MSE_GLOBAL_MAIN_THEME_COLORS[itd_message_title_string_${mseMessageType}_alt]}"
      mseTmpArrThemePrepareMessage["title_string_colorize"]="1"
      mseTmpArrThemePrepareMessage["title_string_end"]="\n"

      mseTmpArrThemePrepareMessage["title_bottom_separator_string"]="\n"
      mseTmpArrThemePrepareMessage["title_bottom_separator_color"]=""
      mseTmpArrThemePrepareMessage["title_bottom_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["title_bottom_separator_colorize"]="0"



      #
      # Bloco 04: Corpo da mensagem
      mseTmpArrThemePrepareMessage["body_show"]="1"

      mseTmpArrThemePrepareMessage["body_top_separator_string"]=""
      mseTmpArrThemePrepareMessage["body_top_separator_color"]=""
      mseTmpArrThemePrepareMessage["body_top_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["body_top_separator_colorize"]="0"

      mseTmpArrThemePrepareMessage["body_first_line_indent"]="     "
      mseTmpArrThemePrepareMessage["body_first_line_bullet"]=""
      mseTmpArrThemePrepareMessage["body_first_line_bullet_color"]=""
      mseTmpArrThemePrepareMessage["body_first_line_bullet_color_alt"]=""
      mseTmpArrThemePrepareMessage["body_first_line_bullet_colorize"]="0"

      mseTmpArrThemePrepareMessage["body_lines_indent"]="     "

      mseTmpArrThemePrepareMessage["body_lines_bullet"]=""
      mseTmpArrThemePrepareMessage["body_lines_bullet_color"]=""
      mseTmpArrThemePrepareMessage["body_lines_bullet_color_alt"]=""
      mseTmpArrThemePrepareMessage["body_lines_bullet_colorize"]="0"

      mseTmpArrThemePrepareMessage["body_lines_color"]="${MSE_GLOBAL_MAIN_THEME_COLORS[itd_message_body]}"
      mseTmpArrThemePrepareMessage["body_lines_color_alt"]="${MSE_GLOBAL_MAIN_THEME_COLORS[itd_message_body_alt]}"
      mseTmpArrThemePrepareMessage["body_lines_colorize"]="1"

      mseTmpArrThemePrepareMessage["body_bottom_separator_string"]=""
      mseTmpArrThemePrepareMessage["body_bottom_separator_color"]=""
      mseTmpArrThemePrepareMessage["body_bottom_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["body_bottom_separator_colorize"]="0"



      #
      # Bloco 05: Separador inferior da mensagem
      mseTmpArrThemePrepareMessage["bottom_separator_string"]="\n"
      mseTmpArrThemePrepareMessage["bottom_separator_color"]=""
      mseTmpArrThemePrepareMessage["bottom_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["bottom_separator_colorize"]="0"

    ;;

    title)

      #
      # Configuração geral para uma mensagem de título
      # Imprime apenas o bloco do título com espaçamento simples
      # acima e abaixo.

      #
      # Bloco 02: Separador superior da mensagem
      mseTmpArrThemePrepareMessage["top_separator_string"]=""
      mseTmpArrThemePrepareMessage["top_separator_color"]=""
      mseTmpArrThemePrepareMessage["top_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["top_separator_colorize"]="0"



      #
      # Bloco 03: Título
      mseTmpArrThemePrepareMessage["title_show"]="1"

      mseTmpArrThemePrepareMessage["title_top_separator_string"]="\n"
      mseTmpArrThemePrepareMessage["title_top_separator_color"]=""
      mseTmpArrThemePrepareMessage["title_top_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["title_top_separator_colorize"]="0"

      mseTmpArrThemePrepareMessage["title_indent"]="  "

      mseTmpArrThemePrepareMessage["title_bullet"]=":: "
      mseTmpArrThemePrepareMessage["title_bullet_color"]=""
      mseTmpArrThemePrepareMessage["title_bullet_color_alt"]=""
      mseTmpArrThemePrepareMessage["title_bullet_colorize"]="0"

      mseTmpArrThemePrepareMessage["title_string_color"]="${MSE_GLOBAL_MAIN_THEME_COLORS[itd_message_title_string_${mseMessageType}]}"
      mseTmpArrThemePrepareMessage["title_string_color_alt"]="${MSE_GLOBAL_MAIN_THEME_COLORS[itd_message_title_string_${mseMessageType}_alt]}"
      mseTmpArrThemePrepareMessage["title_string_colorize"]="1"
      mseTmpArrThemePrepareMessage["title_string_end"]="\n"

      mseTmpArrThemePrepareMessage["title_bottom_separator_string"]="\n"
      mseTmpArrThemePrepareMessage["title_bottom_separator_color"]=""
      mseTmpArrThemePrepareMessage["title_bottom_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["title_bottom_separator_colorize"]="0"



      #
      # Bloco 04: Corpo da mensagem
      mseTmpArrThemePrepareMessage["body_show"]="0"



      #
      # Bloco 05: Separador inferior da mensagem
      mseTmpArrThemePrepareMessage["bottom_separator_string"]=""
      mseTmpArrThemePrepareMessage["bottom_separator_color"]=""
      mseTmpArrThemePrepareMessage["bottom_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["bottom_separator_colorize"]="0"

    ;;

    status)

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
      # Bloco 02: Separador superior da mensagem
      mseTmpArrThemePrepareMessage["top_separator_string"]=""
      mseTmpArrThemePrepareMessage["top_separator_color"]=""
      mseTmpArrThemePrepareMessage["top_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["top_separator_colorize"]="0"



      #
      # Bloco 03: Título
      mseTmpArrThemePrepareMessage["title_show"]="1"

      mseTmpArrThemePrepareMessage["title_top_separator_string"]=""
      mseTmpArrThemePrepareMessage["title_top_separator_color"]=""
      mseTmpArrThemePrepareMessage["title_top_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["title_top_separator_colorize"]="0"

      mseTmpArrThemePrepareMessage["title_indent"]="  "

      mseTmpArrThemePrepareMessage["title_bullet"]=":: "
      mseTmpArrThemePrepareMessage["title_bullet_color"]=""
      mseTmpArrThemePrepareMessage["title_bullet_color_alt"]=""
      mseTmpArrThemePrepareMessage["title_bullet_colorize"]="0"

      mseTmpArrThemePrepareMessage["title_string_color"]="${MSE_GLOBAL_MAIN_THEME_COLORS[itd_message_title_string_${mseMessageType}]}"
      mseTmpArrThemePrepareMessage["title_string_color_alt"]="${MSE_GLOBAL_MAIN_THEME_COLORS[itd_message_title_string_${mseMessageType}_alt]}"
      mseTmpArrThemePrepareMessage["title_string_colorize"]="1"
      mseTmpArrThemePrepareMessage["title_string_end"]=""

      mseTmpArrThemePrepareMessage["title_bottom_separator_string"]=""
      mseTmpArrThemePrepareMessage["title_bottom_separator_color"]=""
      mseTmpArrThemePrepareMessage["title_bottom_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["title_bottom_separator_colorize"]="0"



      #
      # Bloco 04: Corpo da mensagem
      mseTmpArrThemePrepareMessage["body_show"]="0"



      #
      # Bloco 05: Separador inferior da mensagem
      mseTmpArrThemePrepareMessage["bottom_separator_string"]=""
      mseTmpArrThemePrepareMessage["bottom_separator_color"]=""
      mseTmpArrThemePrepareMessage["bottom_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["bottom_separator_colorize"]="0"
    ;;
  esac
}










#
# @desc
# Efetivamente monta e mostra a mensagem a partir das configurações indicadas.
#
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# mensagem.
mse_inter_theme_default_showMessage() {
  declare -n mseTmpThemeArrShowMessage="${1}"


  if [ "${mseTmpThemeArrShowMessage[meta_format]}" == "default" ]; then
    local mseValidBody="1"

    #
    # Altera o tipo de mensagem de "default" para "title" quando não há um
    # body definido ou quando o mesmo está vazio
    if [ "${mseTmpThemeArrShowMessage[body_lines]}" == "" ]; then
      mseValidBody="0"
    else
      #
      # Verifica se o array de "body_lines" é válido e possui dados.
      if [[ ! "$(declare -p ${mseTmpThemeArrShowMessage[body_lines]} 2> /dev/null)" =~ "declare -a" ]]; then
        mseValidBody="0"
      else
        declare -n mseTmpThemeBodyArrayName="${mseTmpThemeArrShowMessage["body_lines"]}"
        if [ "${#mseTmpThemeBodyArrayName[@]}" == "0" ]; then
          mseValidBody="0"
        fi
      fi
    fi


    if [ "${mseValidBody}" == "0" ]; then
      mseTmpThemeArrShowMessage[meta_format]="title"
      mse_inter_theme_default_prepareMessage "${1}"
    fi
  fi


  #
  # Para este tema existem 2 formatos de títulos.
  # - simple
  #   Toda a string que forma a mensagem do título é mostrada conforme
  #   for definida originalmente
  #
  # - code
  #   Se identificar o separador "::" irá usar o formato "code" onde, a primeira parte
  #   deve ser alguma meta informação de utilidade para o usuário identificar a natureza da
  #   mensagem que está sendo mostrada.
  #
  mseTmpThemeArrShowMessage[title_type]="simple"
  if [[ "${mseTmpThemeArrShowMessage[title_string]}" == *"::"* ]]; then
    mseTmpThemeArrShowMessage[title_type]="code"
  fi




  mse_inter_theme_default_showMessage_createSeparator "${mseTmpThemeArrShowMessage[meta_type]}" "${mseTmpThemeArrShowMessage[top_separator_string]}" "${mseTmpThemeArrShowMessage[top_separator_color]}" "${mseTmpThemeArrShowMessage[top_separator_color_alt]}" "${mseTmpThemeArrShowMessage[top_separator_colorize]}"
  mse_inter_theme_default_showMessage_createTitle "${1}"
  mse_inter_theme_default_showMessage_createBody "${1}"
  mse_inter_theme_default_showMessage_createSeparator "${mseTmpThemeArrShowMessage[meta_type]}" "${mseTmpThemeArrShowMessage[bottom_separator_string]}" "${mseTmpThemeArrShowMessage[bottom_separator_color]}" "${mseTmpThemeArrShowMessage[bottom_separator_color_alt]}" "${mseTmpThemeArrShowMessage[bottom_separator_colorize]}"
}



#
# Monta um separador conforme as informações passadas.
#
# @param string $1
# Tipo de mensagem.
#
# @param string $2
# String a ser usada.
#
# @param string $3
# Código da cor a ser usada.
#
# @param string $4
# Código da cor alternativa a ser usada.
#
# @param bool $5
# Indica se deve usar a colorização indicada.
# Use "0" para não.
# Use "1" para sim.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_inter_theme_default_showMessage_createSeparator() {
  #
  # Apenas se o separador foi mesmo definido
  if [ "${2}" != "" ]; then
    local mseReturn=""

    #
    # Havendo necessidade de colorização...
    if [ "${5}" == "1" ]; then
      mseReturn+="${3}"
    fi
    mseReturn+="${2}"
    if [ "${5}" == "1" ]; then
      mseReturn+="${mseNONE}"
    fi

    printf "${mseReturn}"
  fi
}



#
# Monta um bullet conforme as informações passadas.
#
# @param string $1
# Tipo de mensagem.
#
# @param string $2
# String a ser usada.
#
# @param string $3
# Código da cor a ser usada.
#
# @param string $4
# Código da cor alternativa a ser usada.
#
# @param bool $5
# Indica se deve usar a colorização indicada.
# Use "0" para não.
# Use "1" para sim.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_inter_theme_default_showMessage_createBullet() {
  mse_inter_theme_default_showMessage_createSeparator "${1}" "${2}" "${3}" "${4}" "${5}"
}





#
# Monta toda a parte do título da mensagem conforme as configurações
# definidas e o tema de cores utilizado.
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# mensagem.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_inter_theme_default_showMessage_createTitle() {
  declare -n mseTmpThemeArrCreateTitle="${1}"

  if [ "${mseTmpThemeArrCreateTitle[title_show]}" == "1" ]; then
    local mseMessageType="${mseTmpThemeArrCreateTitle[meta_type]}"

    local mseTitleType="${mseTmpThemeArrCreateTitle[title_type]}"

    local mseTitleTopSeparatorString="${mseTmpThemeArrCreateTitle[title_top_separator_string]}"
    local mseTitleTopSeparatorColor="${mseTmpThemeArrCreateTitle[title_top_separator_color]}"
    local mseTitleTopSeparatorColorAlt="${mseTmpThemeArrCreateTitle[title_top_separator_color_alt]}"
    local mseTitleTopSeparatorColorize="${mseTmpThemeArrCreateTitle[title_top_separator_colorize]}"

    local mseTitleIndent="${mseTmpThemeArrCreateTitle[title_indent]}"

    local mseTitleBullet="${mseTmpThemeArrCreateTitle[title_bullet]}"
    local mseTitleBulletColor="${mseTmpThemeArrCreateTitle[title_bullet_color]}"
    local mseTitleBulletColorAlt="${mseTmpThemeArrCreateTitle[title_bullet_color_alt]}"
    local mseTitleBulletColorize="${mseTmpThemeArrCreateTitle[title_bullet_colorize]}"

    local mseTitleString="${mseTmpThemeArrCreateTitle[title_string]}"
    local mseTitleStringColor="${mseTmpThemeArrCreateTitle[title_string_color]}"
    local mseTitleStringColorAlt="${mseTmpThemeArrCreateTitle[title_string_color_alt]}"
    local mseTitleStringColorize="${mseTmpThemeArrCreateTitle[title_string_colorize]}"
    local mseTitleStringEnd="${mseTmpThemeArrCreateTitle[title_string_end]}"

    local mseTitleBottomSeparatorString="${mseTmpThemeArrCreateTitle[title_bottom_separator_string]}"
    local mseTitleBottomSeparatorColor="${mseTmpThemeArrCreateTitle[title_bottom_separator_color]}"
    local mseTitleBottomSeparatorColorAlt="${mseTmpThemeArrCreateTitle[title_bottom_separator_color_alt]}"
    local mseTitleBottomSeparatorColorize="${mseTmpThemeArrCreateTitle[title_bottom_separator_colorize]}"



    #
    # Sendo um título com um formato definido (diferente de "custom")
    # E, sendo no momento vazio...
    # Redefine o título da mensagem com a legenda correspondente ao tipo de mensagem.
    if [ "${mseTitleString}" == "" ]; then
      case "${mseMessageType}" in
        info | i)
          mseTitleString="${lbl_inter_alert_header_info}"
        ;;
        attention | a)
          mseTitleString="${lbl_inter_alert_header_attention}"
        ;;
        warning | w)
          mseTitleString="${lbl_inter_alert_header_warning}"
        ;;
        error | e)
          mseTitleString="${lbl_inter_alert_header_error}"
        ;;
        fail | f)
          mseTitleString="${lbl_inter_alert_header_fail}"
        ;;
        success | s)
          mseTitleString="${lbl_inter_alert_header_success}"
        ;;

        friendly | fr | ordinary | or | caution | ca | important | im)
          mseTitleString=""
        ;;
      esac

    fi





    #
    # Monta o texto do título
    local mseUseTitle=""
    local mseUseTitleColor=""
    local mseUseTitleColorAlt=""
    declare -a mseTitleTextParts=()


    #
    # Resgata as cores a serem usadas
    if [ "${mseTitleStringColorize}" == "1" ]; then
      mseUseTitleColor="${mseTitleStringColor}"
      mseUseTitleColorAlt="${mseTitleStringColorAlt}"
    fi


    #
    # Conforme o tipo de título a ser usado...
    case "${mseTitleType}" in
      simple)

        mseUseTitle="${mseUseTitleColor}${mseTitleString}${mseNONE}"

      ;;

      code)

        mse_str_split "::" "${mseTitleString}"
        mseTitleTextParts="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"

        if [ "${mseTitleTextParts}" -le "1" ]; then
          mseUseTitle="[ ${mseUseTitleColorAlt}script${mseNONE} ] ${mseUseTitleColor}${mseTitleString}${mseNONE}"
        else
          mseUseTitle="[ ${mseUseTitleColorAlt}${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}${mseNONE} ] ${mseUseTitleColor}${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]:1}${mseNONE}"
        fi

      ;;
    esac



    #
    # Imprime os componente do título conforme configuração
    mse_inter_theme_default_showMessage_createSeparator "${mseMessageType}" "${mseTitleTopSeparatorString}" "${mseTitleTopSeparatorColor}" "${mseTitleTopSeparatorColorAlt}" "${mseTitleTopSeparatorColorize}"
    printf "${mseTitleIndent}"
    mse_inter_theme_default_showMessage_createBullet "${mseMessageType}" "${mseTitleBullet}" "${mseTitleBulletColor}" "${mseTitleBulletColorAlt}" "${mseTitleBulletColorize}"
    printf "${mseUseTitle}${mseTitleStringEnd}"
    mse_inter_theme_default_showMessage_createSeparator "${mseMessageType}" "${mseTitleBottomSeparatorString}" "${mseTitleBottomSeparatorColor}" "${mseTitleBottomSeparatorColorAlt}" "${mseTitleBottomSeparatorColorize}"
  fi
}





#
# Monta toda a parte do título da mensagem conforme as configurações
# definidas e o tema utilizado
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# mensagem.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_inter_theme_default_showMessage_createBody() {
  declare -n mseTmpThemeArrCreateBody="${1}"

  if [ "${mseTmpThemeArrCreateBody[body_show]}" == "1" ]; then
    local mseMessageType="${mseTmpThemeArrCreateBody[meta_type]}"

    local mseBodyTopSeparatorString="${mseTmpThemeArrCreateBody[body_top_separator_string]}"
    local mseBodyTopSeparatorColor="${mseTmpThemeArrCreateBody[body_top_separator_color]}"
    local mseBodyTopSeparatorColorAlt="${mseTmpThemeArrCreateBody[body_top_separator_color_alt]}"
    local mseBodyTopSeparatorColorize="${mseTmpThemeArrCreateBody[body_top_separator_colorize]}"

    local mseBodyFirstLineIndent="${mseTmpThemeArrCreateBody[body_first_line_indent]}"

    local mseBodyFirstLineBullet="${mseTmpThemeArrCreateBody[body_first_line_bullet]}"
    local mseBodyFirstLineBulletColor="${mseTmpThemeArrCreateBody[body_first_line_bullet_color]}"
    local mseBodyFirstLineBulletColorAlt="${mseTmpThemeArrCreateBody[body_first_line_bullet_color_alt]}"
    local mseBodyFirstLineBulletColorize="${mseTmpThemeArrCreateBody[body_first_line_bullet_colorize]}"

    local mseBodyLinesIndent="${mseTmpThemeArrCreateBody[body_lines_indent]}"

    local mseBodyLinesBullet="${mseTmpThemeArrCreateBody[body_lines_bullet]}"
    local mseBodyLinesBulletColor="${mseTmpThemeArrCreateBody[body_lines_bullet_color]}"
    local mseBodyLinesBulletColorAlt="${mseTmpThemeArrCreateBody[body_lines_bullet_color_alt]}"
    local mseBodyLinesBulletColorize="${mseTmpThemeArrCreateBody[body_lines_bullet_colorize]}"

    declare -n mseBodyLines="${mseTmpThemeArrCreateBody[body_lines]}"
    local mseBodyLinesColor="${mseTmpThemeArrCreateBody[body_lines_color]}"
    local mseBodyLinesColorAlt="${mseTmpThemeArrCreateBody[body_lines_color_alt]}"
    local mseBodyLinesColorize="${mseTmpThemeArrCreateBody[body_lines_colorize]}"

    local mseBodyBottomSeparatorString="${mseTmpThemeArrCreateBody[body_bottom_separator_string]}"
    local mseBodyBottomSeparatorColor="${mseTmpThemeArrCreateBody[body_bottom_separator_color]}"
    local mseBodyBottomSeparatorColorAlt="${mseTmpThemeArrCreateBody[body_bottom_separator_color_alt]}"
    local mseBodyBottomSeparatorColorize="${mseTmpThemeArrCreateBody[body_bottom_separator_colorize]}"





    #
    # Monta o corpo da mensagem
    local mseLineText=""
    local mseCountLines=0

    local mseLineIndent
    local mseLineBullet
    local mseLineBulletColor
    local mseLineBulletColorAlt
    local mseLineBulletColorize

    local mseUseBody

    for mseLineText in "${mseBodyLines[@]}"; do
      ((mseCountLines=mseCountLines+1))

      if [ "${mseCountLines}" == "1" ]; then
        #
        # Configurações para a primeira linha
        mseLineIndent="${mseBodyFirstLineIndent}"
        mseLineBullet="${mseBodyFirstLineBullet}"
        mseLineBulletColor="${mseBodyFirstLineBulletColor}"
        mseLineBulletColorAlt="${mseBodyFirstLineBulletColorAlt}"
        mseLineBulletColorize="${mseBodyFirstLineBulletColorize}"
      else
        #
        # Configurações para as demais linhas
        mseLineIndent="${mseBodyLinesIndent}"
        mseLineBullet="${mseBodyLinesBullet}"
        mseLineBulletColor="${mseBodyLinesBulletColor}"
        mseLineBulletColorAlt="${mseBodyLinesBulletColorAlt}"
        mseLineBulletColorize="${mseBodyLinesBulletColorize}"
      fi


      mseUseBody+="${mseLineIndent}"
      mseUseBody+=$(mse_inter_theme_default_showMessage_createBullet "${mseMessageType}" "${mseLineBullet}" "${mseLineBulletColor}" "${mseLineBulletColorAlt}" "${mseLineBulletColorize}")

      if [ "${mseBodyLinesColorize}" == "1" ]; then
        mseUseBody+="${mseBodyLinesColor}"
      fi
      mseUseBody+="${mseLineText}"
      if [ "${mseBodyLinesColorize}" == "1" ]; then
        mseUseBody+="${mseNONE}"
      fi

      mseUseBody+="\n"
    done


    mse_inter_theme_default_showMessage_createSeparator "${mseMessageType}" "${mseBodyTopSeparatorString}" "${mseBodyTopSeparatorColor}" "${mseBodyTopSeparatorColorAlt}" "${mseBodyTopSeparatorColorize}"
    printf "${mseUseBody}"
    mse_inter_theme_default_showMessage_createSeparator "${mseMessageType}" "${mseBodyBottomSeparatorString}" "${mseBodyBottomSeparatorColor}" "${mseBodyBottomSeparatorColorAlt}" "${mseBodyBottomSeparatorColorize}"
  fi
}









#
# @desc
# Permite montar uma barra de progresso no terminal oferecendo uma série de
# recursos para a estilização do mesmo em seus scripts.
#
# A barra de progresso é um componente de uma única linha mas que possui dois
# blocos. Um é a própria barra de progresso e o outro é uma área
# informativa que pode ou não ser usada e serve para adicionar alguma
# extra na barra. Esta área informativa pode ser atualizada a cada nova
# iteração.
#
#
#
# São esperadas as seguintes chaves de configuração:
#
# [ProgressBarIndent]
# Indentação para a barra.
# Use apenas espaços em branco.
# Deixe vazio para não usar.
#
# [ProgressBarFormat]
# Formato.
# Pode ser um tipo específico de formatação definido no tema a ser usado ou
# o nome de uma função que possui uma formatação especial para a barra de
# progresso.
# Se não for definido, internamente usará o valor padrão 'default'.
#
#
#
# [ProgressBarColor]
# Indica se deve permitir a colorização do bloco da barra de progresso.
# Use "0" para não.
# Use "1" para sim.
#
# [ProgressBarBlockStart]
# Caracteres que demarcam o início da barra de progresso.
# Deixe vazio para não usar.
#
# [ProgressBarBlockEnd]
# Caracteres que demarcam o fim da barra de progresso.
# Deixe vazio para não usar.
#
# [ProgressBarBlockChar]
# Caracter que será usado para preencher a barra de progresso.
# Se for deixado vazio, usará o caracter "#"
#
# [ProgressBarTotalCharLength]
# Tamanho total da barra de progresso (em caracteres).
# O valor mínimo aceitável é de 20 caracteres e o máximo de 100.
# Esta é a medida apenas da própria barra de progresso.
# Valores inválidos serão revertidos para "30".
#
# [ProgressBarAtualPercentProgress]
# Percentual atual de andamento do progresso.
# Use apenas valores entre 0 e 100.
# Valores inválidos serão revertidos para "0".
#
# [ProgressBarAtualBarLength]
# CONTROLADO INTERNAMENTE
# Cálculo do tamanho total (em chars) que o componente da barra deve ter
# para representar o percentual de progresso atual.
#
#
#
# [ProgressBarInfoDisplay]
# Indica se deve mostrar a área informativa da barra contendo
# informações extras sobre a mesma.
# Use "0" para não mostrar (padrão).
# Use "1" para mostrar.
#
# [ProgressBarInfoColor]
# Indica se deve permitir a colorização do bloco da área informativa.
# Use "0" para não.
# Use "1" para sim.
#
# [ProgressBarInfoPosition]
# Posicionamento da área informativa em relação à barra de progresso.
#   - l   : à esquerda.
#   - r   : à direita (padrão).
#
# [ProgressBarInfoBlockStart]
# Caracteres que demarcam o início da área informativa.
# Deixe vazio para não usar.
#
# [ProgressBarInfoBlockEnd]
# Caracteres que demarcam o fim da área informativa.
# Deixe vazio para não usar.
#
# [ProgressBarInfoUsePercent]
# Indica se deve usar o percentual atual do progresso para preencher a
# informação da área informativa.
# Use "0" para não.
# Use "1" para sim.
#
# [ProgressBarInfoData]
# Informação que deve ser usada para preencher a área informativa.
#
#
#
# Observação 01:
# A real aplicabilidade de cor em cada uma das partes depende do tema
# selecionado. Então, indicar que se deseja aplicar cor a toda barra
# implica em informar ao formatador do tema selecionado que ele pode aplicar
# cores em todos os elementos que ele está apto a fazê-lo.
#
# Observação 02:
# A cor de cada parte é definida conforme o "tema" selecionado para a
# barra de progresso.
# Se uma cor for definida diretamente na referida parte, estas, se sobreporão
# ao que é indicado pelo "tema" selecionado.
#
# Observação 03:
# Quando uma função de tema é acionada ela deve carregar uma série de
# informações sobre cada cor que será usada em cada tipo de barra de progresso.
# As cores devem ser registradas em arrays associativos que correspondem a
# cada elemento capaz de receber colorização em cada um dos blocos que formam
# a barra como um todo.
# Abaixo segue uma lista contendo o nome de cada array associativo usado para
# tal finalidade.
#
# MSE_GSPBCTC = MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG_THEME_COLOR
#
# [Bloco 01: Barra de progresso]
# - MSE_GSPBCTC_B01_DELIMITERS
# - MSE_GSPBCTC_B01_CHAR
#
# [Bloco 02: Título]
# - MSE_GSPBCTC_B02_DELIMITERS
# - MSE_GSPBCTC_B02_DATA
#
#
#
# @return
# printa a barra de progresso conforme as indicações passadas.
mse_inter_theme_default_createProgressBar() {

  #
  # Padrão para as configurações das barras de progresso de tipo previsto
  case "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarFormat]}" in
    custom)

      #
      # Permite uma configuração livre do componente
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarFormat"]="custom"

    ;;

    default)

      #
      # Configuração geral para uma barra de progresso padrão
      # Imprime a barra e a área informativa.

      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarIndent"]="  "


      #
      # Bloco 01: Barra de progresso
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarColor"]="1"
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockStart"]="[ "
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockEnd"]=" ] "
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockChar"]="#"

      # Controlado internamente
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarAtualBarLength"]="0"


      #
      # Bloco 02: Área informativa
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoDisplay"]="1"
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoColor"]="1"
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoPosition"]="r"
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoBlockStart"]="("
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoBlockEnd"]=")"
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoData"]="  0%"

    ;;

    ONLYBAR)

      #
      # Configuração para uma barra de progresso em que apenas a barra
      # é apresentada. A área informativa é omitida

      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarIndent"]="  "


      #
      # Bloco 01: Barra de progresso
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarColor"]="1"
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockStart"]="[ "
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockEnd"]=" ] "
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockChar"]="#"

      # Controlado internamente
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarAtualBarLength"]="0"


      #
      # Bloco 02: Área informativa
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoDisplay"]="0"

    ;;
  esac



  #
  # Efetivamente printa a barra de progresso
  mse_inter_setProgressBar "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarAtualPercentProgress]}"
}
