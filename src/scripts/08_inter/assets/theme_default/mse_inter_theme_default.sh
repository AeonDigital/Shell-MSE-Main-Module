#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







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
#       prompt    : mse_inter_showPrompt
#       progress  : mse_inter_showProgressBar
#       spinner   : mse_inter_startSpinner
#       man       : mse_mmod_help_man
#       metadata  : mse_mmod_mng_showMetaData
#
# - 03: Subtipo/tom de mensagem/informação
#       Uso opcional.
#       Usado quando a informação gerada pela função alvo pode ser definida
#       como de um certo tipo, geralmente indicando o "tom" da mensagem.
#       Ex: As funções "mse_inter_showMessage" e "mse_inter_showPrompt".
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
    # Define as cores que podem ser usadas pelos componentes de
    # uma barra de progresso
    MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_progressbar_bar]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LBLUE" "1")
    MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_progressbar_bar_alt]=$(mse_font_createStyle "4" "BOLD" "NONE" "LYELLOW" "1")
    MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_progressbar_info]=$(mse_font_createStyle "4" "BOLD" "NONE" "DLCYAN" "1")
    MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_progressbar_info_alt]=$(mse_font_createStyle "4" "BOLD" "NONE" "DWHITE" "1")


    #
    # Define as cores que podem ser usadas pelo "man"
    MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_man_at]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "BLUE" "1")
    MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_man_tagName]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "BLUE" "1")
    MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_man_tagCommom]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LCYAN" "1")
    MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_man_param]=$(mse_font_createStyle "8" "BOLD" "NONE" "250" "1")


    #
    # Define as cores usadas para o comando "showMetaData"
    MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_man_module]=$(mse_font_createStyle "4" "BOLD" "NONE" "BLUE" "1")
    MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_man_subModule]=$(mse_font_createStyle "4" "BOLD" "NONE" "BLUE" "1")
    MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_man_functions]=$(mse_font_createStyle "4" "" "NONE" "LBLACK" "1")

    MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_man_separator]=$(mse_font_createStyle "4" "" "NONE" "WHITE" "1")
    MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_man_separatorBar]=$(mse_font_createStyle "4" "DARK" "NONE" "WHITE" "1")
    MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_man_selectedElements]=$(mse_font_createStyle "4" "" "NONE" "LBLACK" "1")
    MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_man_totalElements]=$(mse_font_createStyle "4" "" "NONE" "LBLACK" "1")




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


    MSE_GLOBAL_MAIN_THEME_COLORS["${msePrefix}_message_body"]="${mseToneArr[body]}"
    MSE_GLOBAL_MAIN_THEME_COLORS["${msePrefix}_message_body_alt"]="${mseToneArr[body_alt]}"


    #
    # Registra o prefixo usado para identificar as configurações deste tema
    MSE_GLOBAL_MAIN_THEME_COLORS["mse_inter_theme_default"]="${msePrefix}"
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
mse_inter_theme_default_prepareShowMessage() {
  mse_inter_theme_default_setColors

  declare -n mseTmpArrThemePrepareMessage="${1}"
  local mseMessageType="${mseTmpArrThemePrepareMessage[meta_type]}"
  local msePrefix="${MSE_GLOBAL_MAIN_THEME_COLORS[${MSE_GLOBAL_THEME_NAME}]}"


  #
  # Padrão para as configurações das mensagens de tipo previsto
  case "${mseTmpArrThemePrepareMessage[meta_format]}" in
    custom)

      #
      # Permite uma configuração livre do componente
      mseTmpArrThemePrepareMessage["meta_format"]="custom"

    ;;

    default | prompt)

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

      mseTmpArrThemePrepareMessage["title_string_color"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_message_title_string_${mseMessageType}]}"
      mseTmpArrThemePrepareMessage["title_string_color_alt"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_message_title_string_${mseMessageType}_alt]}"
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

      mseTmpArrThemePrepareMessage["body_lines_color"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_message_body]}"
      mseTmpArrThemePrepareMessage["body_lines_color_alt"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_message_body_alt]}"
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


      if [ "${mseTmpArrThemePrepareMessage[meta_format]}" == "prompt" ]; then
        mseTmpArrThemePrepareMessage["title_bottom_separator_string"]=""
      fi

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

      mseTmpArrThemePrepareMessage["title_string_color"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_message_title_string_${mseMessageType}]}"
      mseTmpArrThemePrepareMessage["title_string_color_alt"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_message_title_string_${mseMessageType}_alt]}"
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

      mseTmpArrThemePrepareMessage["title_string_color"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_message_title_string_${mseMessageType}]}"
      mseTmpArrThemePrepareMessage["title_string_color_alt"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_message_title_string_${mseMessageType}_alt]}"
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
# Usado para mensagens.
# Valida o valor "meta_format" indicado. Sendo válido, retorna ele próprio.
# Sendo inválido, retorna o valor padrão.
#
# @param string $1
# Valor que está sendo testado
#
# @return
# Valor "meta_format" válido para este tema
mse_inter_theme_default_showMessage_checkMetaFormat() {
  declare -a mseAllowedMetaFormat=("custom" "default" "prompt" "status" "title")

  local mseReturn="${1}"
  if [[ ! "${mseAllowedMetaFormat[*]}" =~ "${mseReturn}" ]]; then
    mseReturn="default"
  fi

  printf "${mseReturn}"
}


#
# @desc
# Efetivamente monta e mostra a mensagem a partir das configurações indicadas.
#
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# mensagem.
#
#
# @param string $2
# Opcional.
# Nome de um array associativo trazendo configurações não previstas
# inicialmente. Usado para expandir temas.
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
      mse_inter_theme_default_prepareShowMessage "${1}"
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

  if [ "${mseTmpThemeArrShowMessage[meta_format]}" == "prompt" ]; then
    mse_inter_theme_default_showMessage_createPromptBody "${1}" "${2}"
  fi
  mse_inter_theme_default_showMessage_createMessageBody "${1}"

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
# Monta toda a parte do corpo da mensagem conforme as configurações
# definidas e o tema utilizado.
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# mensagem.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_inter_theme_default_showMessage_createMessageBody() {
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

    if [ "${mseTmpThemeArrCreateBody[body_lines]}" == "" ]; then
      declare -a mseBodyLines=()
    else
      declare -n mseBodyLines="${mseTmpThemeArrCreateBody[body_lines]}"
    fi
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
# Monta toda a parte do corpo do prompt conforme as configurações
# definidas e o tema utilizado.
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# mensagem.
#
# @param string $2
# Opcional.
# Nome de um array associativo trazendo configurações não previstas
# inicialmente. Usado para expandir temas.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_inter_theme_default_showMessage_createPromptBody() {
  declare -n mseTmpThemeArrCreatePrompt="${1}"
  declare -n mseTmpThemePromptConfig="${2}"


  local msePromptExpectedValueType="${mseTmpThemePromptConfig[prompt_expected_value_type]}"
  local msePromptAllowedAssocValues="${mseTmpThemePromptConfig[prompt_allowed_assoc_values]}"


  if [ "${mseTmpThemeArrCreatePrompt[body_show]}" == "1" ] && ([ "${msePromptExpectedValueType}" == "bool" ] || [ "${msePromptExpectedValueType}" == "list" ]); then
    unset mseTmpPromptAssocValues
    unset mseTmpPromptBodyLines

    declare -n mseTmpPromptAssocValues="${msePromptAllowedAssocValues}"
    declare -a mseTmpPromptBodyLines=()

    #
    # Ordena as chaves alfabeticamente
    IFS=$'\n'
    unset mseTmpPromptSortedKeys
    declare -a mseTmpPromptSortedKeys=($(sort <<< "${!mseTmpPromptAssocValues[*]}"))
    IFS=$' \t\n'


    #
    # Identifica todos os valores válidos e monta as linhas
    # de dados que devem ser apresentadas para o usuário como guias de valores
    # válidos a serem escolhidos.
    local mseIndex
    local mseKey
    local mseTmpKeyLabels
    local mseTmpOptionLine

    local mseTmpLineLength
    local mseTmpMaxOptionLength=1

    for mseIndex in "${!mseTmpPromptSortedKeys[@]}"; do
      mseKey="${mseTmpPromptSortedKeys[${mseIndex}]}"

      mse_str_split "::" "${mseTmpPromptAssocValues[${mseKey}]}" "1"
      if [ "${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}" == "0" ]; then
        MSE_GLOBAL_MODULE_SPLIT_RESULT+=("${mseKey}")
      fi
      mseTmpKeyLabels=$(mse_str_join " / " "MSE_GLOBAL_MODULE_SPLIT_RESULT")

      mseTmpOptionLine="${mseKey} : [${mseTmpKeyLabels}]"
      mseTmpPromptBodyLines+=("${mseTmpOptionLine}")

      #
      # Incrementa os contadores de linhas
      mseTmpLineLength=$(wc -m <<< $mseTmpOptionLine)

      if [ "${mseTmpLineLength}" -gt "${mseTmpMaxOptionLength}" ]; then
        mseTmpMaxOptionLength="${mseTmpLineLength}"
      fi
    done



    #
    # Monta as linhas expositivas de opções de forma a focarem agradáveis de ler
    # e fáceis de serem distinguidas
    local mseMaxOptionsPerLine
    local mseTmpOptionPadLength=0
    local mseTmpOptionPadString=""
    ((mseMaxOptionsPerLine = 120 / mseTmpMaxOptionLength))

    unset mseTmpBigLine
    declare -a mseTmpBigLine=()
    declare -n mseTmpPromptBodyLinesArray="${mseTmpThemeArrCreatePrompt[body_lines]}"

    for mseTmpOptionLine in "${mseTmpPromptBodyLines[@]}"; do
      mseTmpLineLength=$(wc -m <<< $mseTmpOptionLine)
      ((mseTmpOptionPadLength = mseTmpMaxOptionLength - mseTmpLineLength))

      mseTmpOptionPadString=$(printf "%-${mseTmpOptionPadLength}s" "")
      mseTmpBigLine+=("${mseTmpOptionLine}${mseTmpOptionPadString}")

      local mseMod=$(expr ${#mseTmpBigLine[@]} % ${mseMaxOptionsPerLine}) || true
      if [ "${mseMod}" == "0" ]; then
        mseTmpPromptBodyLinesArray+=("$(mse_str_join "  |  " "mseTmpBigLine")")

        unset mseTmpBigLine
        declare -a mseTmpBigLine=()
      fi
    done


    if [ "${#mseTmpBigLine[@]}" -gt "0" ]; then
      mseTmpPromptBodyLinesArray+=("$(mse_str_join "  |  " "mseTmpBigLine")")
    fi


    #
    # Inicia a leitura na próxima linha
    mseTmpPromptBodyLinesArray+=("")
  else
    mseTmpThemeArrCreatePrompt[body_lines]=""
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
# barra de progresso.
#
# Para configurar este array associativo use a função "mse_inter_prepareProgressBar".
mse_inter_theme_default_prepareProgressBar() {
  mse_inter_theme_default_setColors

  declare -n mseTmpArrThemePrepareProgressBar="${1}"
  local msePrefix="${MSE_GLOBAL_MAIN_THEME_COLORS[${MSE_GLOBAL_THEME_NAME}]}"


  #
  # Padrão para as configurações das mensagens de tipo previsto
  case "${mseTmpArrThemePrepareProgressBar[meta_format]}" in
    custom)

      #
      # Permite uma configuração livre do componente
      mseTmpArrThemePrepareProgressBar["meta_format"]="custom"

    ;;

    default)

      #
      # Configuração geral para uma barra de progresso padrão
      # Imprime a barra e as informações.

      mseTmpArrThemePrepareProgressBar["meta_indent"]="  "


      #
      # Bloco 02: Barra de progresso
      mseTmpArrThemePrepareProgressBar["bar_ini_string"]="[ "
      mseTmpArrThemePrepareProgressBar["bar_end_string"]=" ] "

      mseTmpArrThemePrepareProgressBar["bar_fill_char"]="#"
      mseTmpArrThemePrepareProgressBar["bar_atual_progress"]="0"
      # Controlado internamente
      mseTmpArrThemePrepareProgressBar["bar_atual_bar_length"]="0"

      mseTmpArrThemePrepareProgressBar["bar_color"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_progressbar_bar]}"
      mseTmpArrThemePrepareProgressBar["bar_color_alt"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_progressbar_bar_alt]}"
      mseTmpArrThemePrepareProgressBar["bar_colorize"]="1"


      #
      # Bloco 03: Informações
      mseTmpArrThemePrepareProgressBar["info_show"]="1"

      mseTmpArrThemePrepareProgressBar["info_ini_string"]="( "
      mseTmpArrThemePrepareProgressBar["info_end_string"]=" )"

      mseTmpArrThemePrepareProgressBar["info_use_percent"]="1"

      mseTmpArrThemePrepareProgressBar["info_color"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_progressbar_info]}"
      mseTmpArrThemePrepareProgressBar["info_color_alt"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_progressbar_info_alt]}"
      mseTmpArrThemePrepareProgressBar["info_colorize"]="1"

    ;;

    onlybar)

      #
      # Configuração para uma barra de progresso em que apenas a barra
      # é apresentada. A área informativa é omitida

      mseTmpArrThemePrepareProgressBar["meta_indent"]="  "


      #
      # Bloco 02: Barra de progresso
      mseTmpArrThemePrepareProgressBar["bar_ini_string"]="[ "
      mseTmpArrThemePrepareProgressBar["bar_end_string"]=" ] "

      mseTmpArrThemePrepareProgressBar["bar_fill_char"]="#"
      mseTmpArrThemePrepareProgressBar["bar_atual_progress"]="0"
      # Controlado internamente
      mseTmpArrThemePrepareProgressBar["bar_atual_bar_length"]="0"

      mseTmpArrThemePrepareProgressBar["bar_color"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_progressbar_bar]}"
      mseTmpArrThemePrepareProgressBar["bar_color_alt"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_progressbar_bar_alt]}"
      mseTmpArrThemePrepareProgressBar["bar_colorize"]="1"


      #
      # Bloco 03: Informações
      mseTmpArrThemePrepareProgressBar["info_show"]="0"


    ;;

  esac
}





#
# @desc
# Usado para barras de progresso.
# Valida o valor "meta_format" indicado. Sendo válido, retorna ele próprio.
# Sendo inválido, retorna o valor padrão.
#
# @param string $1
# Valor que está sendo testado
#
# @return
# Valor "meta_format" válido para este tema
mse_inter_theme_default_progressBar_checkMetaFormat() {
  declare -a mseAllowedMetaFormat=("custom" "default" "onlybar")

  local mseReturn="${1}"
  if [[ ! "${mseAllowedMetaFormat[*]}" =~ "${mseReturn}" ]]; then
    mseReturn="default"
  fi

  printf "${mseReturn}"
}


#
# @desc
# Efetivamente monta e mostra a barra de progresso a partir das configurações
# indicadas.
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# barra de progresso.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_inter_theme_default_showProgressBar() {
  declare -n mseTmpThemeArrShowProgressBar="${1}"


  local mseProgressBarComponent=$(mse_inter_theme_default_showProgressBar_createBar "${1}")
  local mseInformationComponent=$(mse_inter_theme_default_showProgressBar_createInformation "${1}")

  mse_inter_clearLine

  if [ "${mseTmpThemeArrShowProgressBar[info_align]}" == "left" ]; then
    printf "%s" "${mseInformationComponent}"
  fi

  printf "%s" "${mseTmpThemeArrShowProgressBar[meta_indent]}"
  printf "%s" "${mseProgressBarComponent}"

  if [ "${mseTmpThemeArrShowProgressBar[info_align]}" == "right" ]; then
    printf "%s" "${mseInformationComponent}"
  fi


  if [ "${mseTmpThemeArrShowProgressBar[bar_atual_progress]}" == "100" ]; then
    printf "\n"
  else
    printf "\r"
  fi
}


#
# Monta o componente "barra de progresso" conforme as configurações definidas.
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# barra de progresso.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_inter_theme_default_showProgressBar_createBar() {
  declare -n mseTmpThemeArrProgressBar="${1}"

  local mseBarIniString="${mseTmpThemeArrProgressBar[bar_ini_string]}"
  local mseBarEndString="${mseTmpThemeArrProgressBar[bar_end_string]}"

  local mseBarFillChar="${mseTmpThemeArrProgressBar[bar_fill_char]}"
  local mseBarMaxCharLength="${mseTmpThemeArrProgressBar[bar_max_char_length]}"
  local mseBarAtualProgress="${mseTmpThemeArrProgressBar[bar_atual_progress]}"
  local mseBarAtualBarLength="${mseTmpThemeArrProgressBar[bar_atual_bar_length]}"

  local mseBarColor="${mseTmpThemeArrProgressBar[bar_color]}"
  local mseBarColorAlt="${mseTmpThemeArrProgressBar[bar_color_alt]}"
  local mseBarColorize="${mseTmpThemeArrProgressBar[bar_colorize]}"


  #
  # Calcula o tamanho total que a barra deve ter para representar o
  # progresso atualmente definido...
  local mseBarAtualBarLength=0
  ((mseBarAtualBarLength = (mseBarMaxCharLength * mseBarAtualProgress) / 100))
  mseTmpThemeArrProgressBar["bar_atual_bar_length"]="${mseBarAtualBarLength}"


  local mseUseColor=""
  if [ "${mseBarColorize}" == "1" ]; then
    mseUseColor="${mseBarColor}"
  fi



  #
  # Printa o início do delimitador
  printf "%s" "${mseBarIniString}";

  for ((i=0; i<mseBarMaxCharLength; i++)); do
    if [ "${i}" -le "${mseBarAtualBarLength}" ]; then
      mseStrBar+="${mseBarFillChar}"
    else
      mseStrBar+=" "
    fi
  done

  printf "${mseUseColor}"; printf "%s" "${mseStrBar}"; printf "${mseNONE}"

  #
  # Printa o fim do delimitador
  printf "%s" "${mseBarEndString}";
}





#
# Monta o componente "informações" conforme as configurações definidas.
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# barra de progresso.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_inter_theme_default_showProgressBar_createInformation() {
  declare -n mseTmpThemeArrProgressBarInformation="${1}"

  if [ "${mseTmpThemeArrProgressBarInformation[info_show]}" == "1" ]; then

    local mseInfoIniString="${mseTmpThemeArrProgressBarInformation[info_ini_string]}"
    local mseInfoEndString="${mseTmpThemeArrProgressBarInformation[info_end_string]}"

    local mseInfoUsePercent="${mseTmpThemeArrProgressBarInformation[info_use_percent]}"
    local mseInfoData="${mseTmpThemeArrProgressBarInformation[info_data]}"

    local mseInfoColor="${mseTmpThemeArrProgressBarInformation[info_color]}"
    local mseInfoColorAlt="${mseTmpThemeArrProgressBarInformation[info_color_alt]}"
    local mseInfoColorize="${mseTmpThemeArrProgressBarInformation[info_colorize]}"


    local mseUseColor=""
    local mseUseColorAlt=""
    if [ "${mseInfoColorize}" == "1" ]; then
      mseUseColor="${mseInfoColor}"
      mseUseColorAlt="${mseInfoColorAlt}"
    fi



    local mseStrPercent=""
    if [ "${mseInfoUsePercent}" == "1" ]; then

      local mseBarAtualProgress="${mseTmpThemeArrProgressBarInformation[bar_atual_progress]}"
      if [ "${mseBarAtualProgress}" -lt "10" ]; then
        mseStrPercent+="  "
      elif [ "${mseBarAtualProgress}" -lt "100" ]; then
        mseStrPercent+=" "
      fi
      mseStrPercent+="${mseBarAtualProgress}%"
    fi



    #
    # Printa o início do delimitador
    printf "%s" "${mseInfoIniString}"

    #
    # Inicia a informação em si
    printf "${mseUseColor}"
    printf "%s" "${mseStrPercent}"
    printf "${mseNONE}"

    if [ "${mseInfoData}" != "" ]; then
      if [ "${mseStrPercent}" != "" ]; then
        printf " "
      fi
      printf "${mseUseColorAlt}"
      printf "%s" "${mseInfoData}"
      printf "${mseNONE}"
    fi

    #
    # Printa o fim do delimitador
    printf "${mseInfoEndString}"
  fi
}
