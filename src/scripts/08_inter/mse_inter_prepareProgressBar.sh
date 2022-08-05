#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Prepara um array associativo preenchendo as chaves necessárias para a
# execução de um comando "mse_inter_showProgressBar".
#
# Se nenhum critério de configuração for passado, será usado os valores
# padrões definidos pelo tema.
#
# A barra de progresso é um componente de uma única linha.
# As configurações possíveis são divididas em três blocos:
#
# - Bloco 01: Meta formatação
# - Bloco 02: Barra de progresso
# - Bloco 03: Informações
#
#
# @param string $1
# Nome do array associativo que será preenchido.
#
#
#
#
#
# [[ Bloco 01: Meta formatação ]]
#
# @param string $2
# ["meta_theme"]
# Nome do tema usado para renderizar a barra de progresso na tela.
# As configurações do tema sobrescreverão quaisquer outras configurações
# definidas nesta função.
#
# @param string $3
# ["meta_format"]
# Formato.
# Cada tema pode fornecer vários formatos de barra, se for o caso, neste
# parametro deve ser indicado qual deve ser usado. De outra forma o formato
# padrão será utilizado.
#
# @param string $4
# ["meta_indent"]
# Indentação para a barra.
# Use apenas espaços em branco ou deixe vazio para não usar.
#
#
#
#
#
# [[ Bloco 02: Barra de progresso ]]
#
# @param string $5
# ["bar_ini_string"]
# Caracteres que demarcam o início da barra de progresso.
# Deixe vazio para não usar.
#
# @param string $6
# ["bar_end_string"]
# Caracteres que demarcam o fim da barra de progresso.
# Deixe vazio para não usar.
#
#
# @param char $7
# ["bar_fill_char"]
# Caracter que será usado para preencher a barra de progresso.
# Se for deixado vazio, usará o caracter padrão definido no tema.
#
# @param int $8
# ["bar_max_char_length"]
# Tamanho total da barra de progresso (em caracteres).
# O tema usado pode modificar este valor conforme as próprias regras.
#
# @param int $9
# ["bar_atual_progress"]
# Percentual atual de andamento do progresso.
# Use apenas valores entre 0 e 100.
# Valores inválidos serão revertidos para "0".
#
# ["bar_atual_bar_length"]
# CONTROLADO INTERNAMENTE
# Cálculo do tamanho total (em chars) que o componente da barra deve ter
# para representar o percentual de progresso atual.
#
#
# @param string $10
# ["bar_color"]
# Código da cor a ser usada neste elemento.
#
# @param string $11
# ["bar_color_alt"]
# Código da cor alternativa ser usada neste elemento.
#
# @param bool $12
# ["bar_colorize"]
# Indica se deve permitir a colorização deste elemento.
# Use "0" para não.
# Use "1" para sim.
#
#
#
#
# [[ Bloco 03: Informações ]]
#
# @param bool $13
# ["info_show"]
# Indica se deve mostrar a área informativa da barra contendo informações
# extras sobre a mesma.
# Use "0" para não mostrar (padrão).
# Use "1" para mostrar.
#
# @param string $14
# ["info_align"]
# Posicionamento da área informativa em relação à barra de progresso.
#   - l | left  : à esquerda.
#   - r | right : à direita (padrão).
#
#
# @param string $15
# ["info_ini_string"]
# Caracteres que demarcam o início da área informativa.
# Deixe vazio para não usar.
#
# @param string $16
# ["info_end_string"]
# Caracteres que demarcam o fim da área informativa.
# Deixe vazio para não usar.
#
#
# @param bool $17
# ["info_use_percent"]
# Indica se deve usar o percentual atual do progresso para preencher a
# informação da área informativa.
# Use "0" para não.
# Use "1" para sim.
#
# @param string $18
# ["info_data"]
# Informação que deve ser usada para preencher a área informativa.
# Se o percentual de avanço for aparecer também, esta informação aparecerá
# após o mesmo.
#
#
# @param string $19
# ["info_color"]
# Código da cor a ser usada neste elemento.
#
# @param string $20
# ["info_color_alt"]
# Código da cor alternativa ser usada neste elemento.
#
# @param bool $21
# ["info_colorize"]
# Indica se deve permitir a colorização deste elemento.
# Use "0" para não.
# Use "1" para sim.
#
mse_inter_prepareProgressBar() {
  declare -n mseTmpArrPrepareProgressBar="${1}"

  #
  # Remove todas as entradas atualmente definidas no array indicado sem
  # destruí-lo
  local mseKey=""
  for mseKey in "${!mseTmpArrPrepareProgressBar[@]}"; do
    unset mseTmpArrPrepareProgressBar["${mseKey}"]
  done


  #
  # - Bloco 01: Meta formatação
  mseTmpArrPrepareProgressBar["meta_theme"]="${2}"
  mseTmpArrPrepareProgressBar["meta_format"]="${3}"
  mseTmpArrPrepareProgressBar["meta_indent"]="${4}"


  #
  # - Bloco 02: Barra de progresso
  mseTmpArrPrepareProgressBar["bar_ini_string"]="${5}"
  mseTmpArrPrepareProgressBar["bar_end_string"]="${6}"

  mseTmpArrPrepareProgressBar["bar_fill_char"]="${7}"
  mseTmpArrPrepareProgressBar["bar_max_char_length"]="${8}"
  mseTmpArrPrepareProgressBar["bar_atual_progress"]="${9}"
  # Controlado internamente
  mseTmpArrPrepareProgressBar["bar_atual_bar_length"]="0"

  mseTmpArrPrepareProgressBar["bar_color"]="${10}"
  mseTmpArrPrepareProgressBar["bar_color_alt"]="${11}"
  mseTmpArrPrepareProgressBar["bar_colorize"]="${12}"


  #
  # - Bloco 03: Informações
  mseTmpArrPrepareProgressBar["info_show"]="${13}"
  mseTmpArrPrepareProgressBar["info_align"]="${14}"

  mseTmpArrPrepareProgressBar["info_ini_string"]="${15}"
  mseTmpArrPrepareProgressBar["info_end_string"]="${16}"

  mseTmpArrPrepareProgressBar["info_use_percent"]="${17}"
  mseTmpArrPrepareProgressBar["info_data"]="${18}"

  mseTmpArrPrepareProgressBar["info_color"]="${19}"
  mseTmpArrPrepareProgressBar["info_color_alt"]="${20}"
  mseTmpArrPrepareProgressBar["info_colorize"]="${21}"





  #
  # Verifica os valores dos parametros que tem uma coleção limitada de opções válidas
  local mseKey
  local mseValue
  for mseKey in "${!mseTmpArrPrepareProgressBar[@]}"; do
    mseValue="${mseTmpArrPrepareProgressBar[$mseKey]}"

    case "${mseKey}" in
      meta_theme)
        if [ "${mseValue}" != "" ] && [ "$(type -t "${mseValue}_prepareProgressBar")" != "function" ]; then
          mseTmpArrPrepareProgressBar["meta_theme"]=""
        fi
      ;;

      meta_format)
        if [ "${mseValue}" != "" ]; then
          mseTmpArrPrepareProgressBar["meta_format"]="${mseValue,,}"
        fi
      ;;

      #
      # Valores booleanos
      bar_colorize | info_show | info_use_percent | info_colorize)

        if [ "$mseValue" == "" ] || ([ "$mseValue" != "0" ] && [ "$mseValue" != "1" ]); then
          mseValue="0"
        fi
        mseTmpArrPrepareProgressBar[$mseKey]="${mseValue}"

      ;;

      bar_fill_char)

        if [ "${mseValue}" == "" ]; then
          mseTmpArrPrepareProgressBar["bar_fill_char"]="#"
        fi

      ;;

      bar_max_char_length)

        if [ "${mseValue}" == "" ]; then
          mseValue="50"
        else
          local mseCheck=$(mse_check_isInteger "$mseValue")
          if [ "${mseCheck}" == "0" ]; then
            mseValue="50"
          elif [ "${mseValue}" -lt "20" ]; then
            mseValue="20"
          elif [ "${mseValue}" -gt "${COLUMNS}" ]; then
            mseValue="${COLUMNS}"
          fi
        fi
        mseTmpArrPrepareProgressBar["bar_max_char_length"]="${mseValue}"

      ;;

      info_align)

        if [ "${mseValue}" != "l" ] && [ "${mseValue}" != "left" ] && [ "${mseValue}" != "r" ] && [ "${mseValue}" != "right" ]; then
          mseValue="right"
        else
          if [ "${mseValue}" == "l" ]; then
            mseValue="left"
          elif [ "${mseValue}" == "r" ]; then
            mseValue="right"
          fi
        fi
        mseTmpArrPrepareProgressBar["info_align"]="${mseValue}"

      ;;
    esac
  done



  #
  # Finaliza o preparo da mensagem aplicando as configurações que vem do tema
  # selecionado.
  if [ "${mseTmpArrPrepareProgressBar[meta_theme]}" != "" ]; then
    local mseThemePrepareProgressBar="${mseTmpArrPrepareProgressBar[meta_theme]}_prepareProgressBar"
    $mseThemePrepareProgressBar "${1}"
  fi
}
MSE_GLOBAL_CMD["prepare progressBar"]="mse_inter_prepareProgressBar"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_prepareProgressBar_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=21
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="AssocArrayName :: r :: assocName"

  #
  # - Bloco 01: Meta formatação
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="MetaTheme :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="MetaFormat :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="MetaIndent :: o :: string"


  #
  # - Bloco 02: Barra de progresso
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="BarIniString :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5"]="BarEndString :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6"]="BarFillChar :: o :: char"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_7"]="BarMaxCharLength :: o :: int"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_8"]="BarAtualProgress :: o :: int :: 0 :: 0 :: 100"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_9"]="BarColor :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_10"]="BarColorAlt :: o :: char"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_11"]="BarColorize :: o :: bool"


  #
  # - Bloco 03: Título
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_12"]="InfoShow :: o :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_13"]="InfoAlign :: o :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_13_labels"]="l, r"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_13_values"]="left, right"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_14"]="InfoIniString :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_15"]="InfoEndString :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_16"]="InfoUsePercent :: o :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_17"]="InfoData :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_18"]="InfoColor :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_19"]="InfoColorAlt :: o :: char"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_20"]="InfoColorize :: o :: bool"
}
