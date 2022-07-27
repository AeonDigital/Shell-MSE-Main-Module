#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







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
# @param string $1
# Indentação para a barra.
# Use apenas espaços em branco.
# Deixe vazio para não usar.
#
# @param string $2
# Formato.
# Pode ser um tipo específico de formatação definido no tema a ser usado ou
# o nome de uma função que possui uma formatação especial para a barra de
# progresso.
# Se não for definido, internamente usará o valor padrão 'default'.
#
#
#
# @param string $3
# Indica se deve permitir a colorização do bloco da barra de progresso.
# Use "0" para não.
# Use "1" para sim.
#
# @param string $4
# Caracteres que demarcam o início da barra de progresso.
# Deixe vazio para não usar.
#
# @param string $5
# Caracteres que demarcam o fim da barra de progresso.
# Deixe vazio para não usar.
#
# @param char $6
# Caracter que será usado para preencher a barra de progresso.
# Se for deixado vazio, usará o caracter "#"
#
# @param int $7
# Tamanho total da barra de progresso (em caracteres).
# O valor mínimo aceitável é de 20 caracteres e o máximo de 100.
# Esta é a medida apenas da própria barra de progresso.
# Valores inválidos serão revertidos para "50".
#
# @param int $8
# Percentual atual de andamento do progresso.
# Use apenas valores entre 0 e 100.
# Valores inválidos serão revertidos para "0".
#
#
#
# @param bool $9
# Indica se deve mostrar a área informativa da barra contendo
# informações extras sobre a mesma.
# Use "0" para não mostrar (padrão).
# Use "1" para mostrar.
#
# @param bool $10
# Indica se deve permitir a colorização do bloco da área informativa.
# Use "0" para não.
# Use "1" para sim.
#
# @param char $11
# Posicionamento da área informativa em relação à barra de progresso.
#   - l   : à esquerda.
#   - r   : à direita (padrão).
#
# @param string $12
# Caracteres que demarcam o início da área informativa.
# Deixe vazio para não usar.
#
# @param string $13
# Caracteres que demarcam o fim da área informativa.
# Deixe vazio para não usar.
#
# @param bool $14
# Indica se deve usar o percentual atual do progresso para preencher a
# informação da área informativa.
# Use "0" para não.
# Use "1" para sim.
#
# @param string $15
# Informação que deve ser usada para preencher a área informativa.
#
#
#
# @param string $16
# Nome do tema usado para renderizar a barra de progresso a ser mostrada na
# tela. Se nenhuma for indicada, usará o tema padrão definido na variável
# global 'MSE_GLOBAL_THEME_NAME'.
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
mse_inter_showProgressBar() {
  MSE_GLOBAL_LASTERR=""
  unset MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG
  declare -gA MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG

  #
  # Apenas se todos os parametros foram passados
  if [ $# -lt 16 ]; then
    local mseArgs="$#"
    local mseLost
    ((mseLost=16-mseArgs))

    MSE_GLOBAL_LASTERR=$(mse_str_replacePlaceHolder "${lbl_err_lostParameters}" "LOST" "${mseLost}")
  else

    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarIndent"]="${1}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarFormat"]="${2}"


    #
    # Bloco 01: Barra de progresso
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarColor"]="${3}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockStart"]="${4}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockEnd"]="${5}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockChar"]="${6}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarTotalCharLength"]="${7}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarAtualPercentProgress"]="${8}"


    #
    # Bloco 02: Área informativa
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoDisplay"]="${9}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoColor"]="${10}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoPosition"]="${11}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoBlockStart"]="${12}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoBlockEnd"]="${13}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoUsePercent"]="${14}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoData"]="${15}"


    local mseKey
    local mseValue
    local mseTmp
    local mseCheck
    for mseKey in "${!MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[@]}"; do
      mseValue="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[$mseKey]}"

      case "${mseKey}" in
        ProgressBarFormat)

          if [ "${mseValue}" == "" ]; then
            MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarFormat"]="default"
          else
            MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarFormat"]="${mseValue^^}"
          fi

        ;;

        ProgressBarBlockChar)
          mseTmp="#"

          if [ "${#mseValue}" == "1" ]; then
            mseTmp="$mseValue"
          fi

          MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockChar"]="${mseTmp}"
        ;;

        ProgressBarTotalCharLength)
          mseCheck=$(mse_check_isInteger "$mseValue")

          mseTmp=50
          if [ "${mseCheck}" == "1" ]; then
            if [ "${mseValue}" -lt "20" ]; then
              mseTmp=20
            elif [ "${mseValue}" -gt "100" ]; then
              mseTmp=100
            else
              mseTmp="${mseValue}"
            fi
          fi

          MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarTotalCharLength"]="${mseTmp}"
        ;;

        ProgressBarAtualPercentProgress)
          mseCheck=$(mse_check_isInteger "$mseValue")

          mseTmp=0
          if [ "${mseCheck}" == "1" ]; then
            if [ "${mseValue}" -lt "0" ]; then
              mseTmp=0
            elif [ "${mseValue}" -gt "100" ]; then
              mseTmp=100
            else
              mseTmp="${mseValue}"
            fi
          fi

          MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarAtualPercentProgress"]="${mseTmp}"
        ;;

        ProgressBarColor | ProgressBarInfoDisplay | ProgressBarInfoColor | ProgressBarInfoUsePercent)

          mseTmp=1
          if [ "${mseValue}" == "1" ] || [ "${mseValue}" == "0" ]; then
            mseTmp="${mseValue}"
          fi

          MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[${mseKey}]="${mseTmp}"
        ;;

        ProgressBarInfoPosition)

          mseTmp=r
          if [ "${mseValue}" == "r" ] || [ "${mseValue}" == "l" ]; then
            mseTmp="${mseValue}"
          fi

          MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoPosition"]="${mseTmp}"
        ;;

      esac
    done


    #
    # Seleciona a função que deve ser usada para renderizar a mensagem.
    local mseThemeName="${16}"
    local mseThemeFunction="${mseThemeName}_createProgressBar"
    #
    # Verifica se a função é válida, não sendo
    # seta a função definida na variável global 'MSE_GLOBAL_THEME_NAME'
    if [ "$(type -t $mseThemeFunction)" != "function" ]; then
      mseThemeFunction="${MSE_GLOBAL_THEME_NAME}_createProgressBar"
    fi


    #
    # Se há uma função customizada definida, usa-a
    if [ "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[MessageFormat]}" != "" ]; then
      mseThemeFunction="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[MessageFormat]}"

      #
      # Verifica se ela é válida, não sendo
      # seta a função definida na variável global 'MSE_GLOBAL_THEME_NAME'
      if [ "$(type -t $mseThemeFunction)" != "function" ]; then
        mseThemeFunction="${MSE_GLOBAL_THEME_NAME}_createProgressBar"
      fi
    fi


    #
    # Evoca a função que está definida para criar a mensagem
    $mseThemeFunction
  fi
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_showProgressBar_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=15
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="ProgressBarIndent :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="MessageFormat :: r :: string"


  #
  # Bloco 01: Barra de progresso
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="ProgressBarColor :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="ProgressBarBlockStart :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="ProgressBarBlockEnd :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5"]="ProgressBarBlockChar :: r :: char"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6"]="ProgressBarTotalCharLength :: r :: int :: 50 :: 20 :: 100"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_7"]="ProgressBarAtualPercentProgress :: r :: int :: 0 :: 0 :: 100"


  #
  # Bloco 02: Área informativa
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_8"]="ProgressBarInfoDisplay :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_9"]="ProgressBarInfoColor :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_10"]="ProgressBarInfoPosition :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_10_labels"]="l, r"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_10_values"]="l, r"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_11"]="ProgressBarInfoBlockStart :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_12"]="ProgressBarInfoBlockEnd :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_13"]="ProgressBarInfoUsePercent :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_14"]="ProgressBarInfoData :: r :: string"


  #
  # Tema selecionado
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_15"]="ThemeName :: o :: string"
}





#
# Monta toda a parte da barra de progresso conforme as configurações
# definidas e o tema de cores utilizado.
mse_inter_showProgressBar_createBar() {
  local mseStrBar=""
  local mseBarChar="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarBlockChar]}"
  local mseBarLength="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarTotalCharLength]}"
  local mseBarAtualCharLength="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarAtualBarLength]}"

  local mseBarStart="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarBlockStart]}"
  local mseBarEnd="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarBlockEnd]}"


  local mseBarCharColor=""
  local mseBarCharDelimiterColor=""
  if [ "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarColor]}" == "1" ]; then
    mseBarCharColor="${MSE_GSPBCTC_B01_CHAR[b01_char]}"
    mseBarCharDelimiterColor="${MSE_GSPBCTC_B01_DELIMITERS[b01_delimiter]}"
  fi



  #
  # Printa o início do delimitador
  printf "${mseBarCharDelimiterColor}"; printf "%s" "${mseBarStart}"; printf "${mseNONE}"

  #
  # Inicia a printar a barra em si
  printf "${mseBarCharColor}"

  for ((i=0; i<mseBarLength; i++)); do
    if [ "${i}" -le "${mseBarAtualCharLength}" ]; then
      mseStrBar+="${mseBarChar}"
    else
      mseStrBar+=" "
    fi
  done
  printf "%s" "${mseStrBar}"
  printf "${mseNONE}"

  #
  # Printa o fim do delimitador
  printf "${mseBarCharDelimiterColor}"; printf "%s" "${mseBarEnd}"; printf "${mseNONE}"
}





#
# Monta toda a parte da área informativa conforme as configurações
# definidas e o tema de cores utilizado.
mse_inter_showProgressBar_createData() {
  if [ "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarInfoDisplay]}" == "1" ]; then
    local mseStrInfo=""
    local mseInfoData="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarInfoData]}"

    local mseInfoStart="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarInfoBlockStart]}"
    local mseInfoEnd="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarInfoBlockEnd]}"


    local mseInfoColor=""
    local mseInfoDelimiterColor=""
    if [ "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarInfoColor]}" == "1" ]; then
      mseInfoColor="${MSE_GSPBCTC_B02_DATA[b01_data]}"
      mseInfoDelimiterColor="${MSE_GSPBCTC_B02_DELIMITERS[b02_delimiter]}"
    fi


    #
    # Printa o início do delimitador
    printf "${mseInfoDelimiterColor}"; printf "%s" "${mseInfoStart}"; printf "${mseNONE}"

    #
    # Inicia a informação em si
    printf "${mseInfoColor}"; printf "%s" "${mseInfoData}"; printf "${mseNONE}"

    #
    # Printa o fim do delimitador
    printf "${mseInfoDelimiterColor}"; printf "%s" "${mseInfoEnd}"; printf "${mseNONE}"

  fi
}
