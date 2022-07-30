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
  local mseAllowedMetaFormat=("free" "default" "status" "title")

  local mseReturn="${1}"
  if [[ ! "${mseAllowedMetaFormat[*]}" =~ "${mesReturn}" ]]; then
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
      mseTmpArrThemePrepareMessage["title_type"]="3"

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
      mseTmpArrThemePrepareMessage["title_type"]="3"

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
  esac
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
