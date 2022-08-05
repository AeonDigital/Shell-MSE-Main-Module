#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma barra de progresso no terminal.
#
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# barra de progresso.
# Se "" ou inválido, será iniciado o array associativo
# "MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG" usando o tema padrão e este será usado
# para a formatação da barra.
#
# @param string $2
# Formato.
# Cada tema pode fornecer vários formatos de barra, se for o caso, neste
# parametro deve ser indicado qual deve ser usado. De outra forma o formato
# padrão será utilizado.
#
# @param string $3
# Tamanho total da barra de progresso (em caracteres).
# O tema usado pode modificar este valor conforme as próprias regras.
#
# @param int $4
# Percentual atual de andamento do progresso.
# Use apenas valores entre 0 e 100.
# Valores inválidos serão revertidos para "0".
#
# @param string $5
# Posicionamento da área informativa em relação à barra de progresso.
#   - l | left  : à esquerda.
#   - r | right : à direita (padrão).
#
# @param string $6
# Opcional.
# Informação que deve ser usada para preencher a área informativa.
#
# @return
# Printa na tela a barra de progresso conforme configuração passada.
mse_inter_showProgressBar() {
  if [ $# -ge 4 ]; then
    local mseCheck=""

    local mseUseMetaAssoc="${1}"
    local mseUseMetaFormat="${2}"
    local mseUseMaxCharLength="${3}"
    local mseUseAtualProgress="${4}"
    local mseUseInfoAlign="${5}"
    local mseUseInfoData="${6}"
    local mseRedefineTheme="0"

    local mseThemeCheckMetaFormat=""
    local mseThemeShowProgressBar=""


    local mseUseMetaTheme=""
    local mseUseMetaFormat=""


    #
    # Verifica se o nome do array associativo passado é válido
    # Não sendo, seleciona o array global
    if [ "${mseUseMetaAssoc}" == "" ] || [[ ! "$(declare -p ${mseUseMetaAssoc} 2> /dev/null)" =~ "declare -A" ]]; then
      mseUseMetaAssoc="MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG"
    fi
    declare -n mseTmpInterArrShowProgressBar="${mseUseMetaAssoc}"


    #
    # Verifica a definição das informações básicas para inicialização de uma mensagem
    # - meta_theme
    # - meta_format
    local mseIsMetaTheme=$(mse_check_hasKeyInAssocArray "meta_theme" "${mseUseMetaAssoc}")
    if [ "${mseIsMetaTheme}" == "0" ]; then
      mseUseMetaTheme="${MSE_GLOBAL_THEME_NAME}"
      mseRedefineTheme="1"
    else
      mseUseMetaTheme="${mseTmpInterArrShowProgressBar[meta_theme]}"
      if [ "${mseUseMetaTheme}" != "${MSE_GLOBAL_THEME_NAME}" ] && ([ "$(type -t "${mseUseMetaTheme}_prepareProgressBar")" != "function" ] || [ "$(type -t "${mseUseMetaTheme}_progressBar_checkMetaFormat")" != "function" ] || [ "$(type -t "${mseUseMetaTheme}_showProgressBar")" != "function" ]); then
        mseUseMetaTheme="${MSE_GLOBAL_THEME_NAME}"
        mseRedefineTheme="1"
      fi
    fi


    mseThemeCheckMetaFormat="${mseUseMetaTheme}_progressBar_checkMetaFormat"
    mseThemeShowProgressBar="${mseUseMetaTheme}_showProgressBar"


    local mseIsMetaFormat=$(mse_check_hasKeyInAssocArray "meta_format" "${mseUseMetaAssoc}")
    if [ "${mseIsMetaFormat}" == "0" ]; then
      mseUseMetaFormat=$($mseThemeCheckMetaFormat "-")
      mseRedefineTheme="1"
    else
      mseUseMetaFormat="${mseTmpInterArrShowProgressBar[meta_format]}"
    fi

    if [ "${2}" != "" ] && [ "${2}" != "${mseUseMetaFormat}" ]; then
      mseUseMetaFormat=$($mseThemeCheckMetaFormat "${2}")
      mseRedefineTheme="1"
    fi





    #
    # Redefine as configurações segundo o tema caso necessário
    if [ "${mseRedefineTheme}" == "1" ]; then
      mse_inter_prepareProgressBar "${mseUseMetaAssoc}" "${mseUseMetaTheme}" "${mseUseMetaFormat}"
    fi




    #
    # Verifica se o tamanho máximo definido para a barra de progresso é
    # válida.
    mseCheck=$(mse_check_isInteger "$mseUseMaxCharLength")
    if [ "${mseCheck}" == "0" ]; then
      mseUseMaxCharLength="50"
    elif [ "${mseUseMaxCharLength}" -lt "20" ]; then
      mseUseMaxCharLength="20"
    elif [ "${mseUseMaxCharLength}" -gt "${COLUMNS}" ]; then
      mseUseMaxCharLength="${COLUMNS}"
    fi
    mseTmpInterArrShowProgressBar[bar_max_char_length]="${mseUseMaxCharLength}"


    #
    # Redefine o progresso atual
    mseCheck=$(mse_check_isInteger "$mseUseAtualProgress")
    if [ "${mseCheck}" == "0" ] || [ "${mseUseAtualProgress}" -lt "0" ]; then
      mseUseAtualProgress="0"
    elif [ "${mseUseAtualProgress}" -gt "100" ]; then
      mseUseAtualProgress="100"
    fi
    mseTmpInterArrShowProgressBar[bar_atual_progress]="${mseUseAtualProgress}"



    #
    # Redefine a informação complementar
    mseTmpInterArrShowProgressBar[info_align]="right"
    mseTmpInterArrShowProgressBar[info_data]=""
    if [ "${mseTmpInterArrShowProgressBar[info_show]}" == "1" ]; then
      if [ "${mseUseInfoAlign}" != "l" ] && [ "${mseUseInfoAlign}" != "left" ] && [ "${mseUseInfoAlign}" != "r" ] && [ "${mseUseInfoAlign}" != "right" ]; then
        mseUseInfoAlign="right"
      else
        if [ "${mseUseInfoAlign}" == "l" ]; then
          mseUseInfoAlign="left"
        elif [ "${mseUseInfoAlign}" == "r" ]; then
          mseUseInfoAlign="right"
        fi
      fi

      mseTmpInterArrShowProgressBar[info_align]="${mseUseInfoAlign}"
      mseTmpInterArrShowProgressBar[info_data]="${mseUseInfoData}"
    fi



    #
    # Efetivamente cria a mensagem usando o tema definido
    ${mseThemeShowProgressBar} ${mseUseMetaAssoc}
  fi
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_showProgressBar_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=6
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="AssocArrayName :: r :: assocName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="MetaFormat :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="BarMaxCharLength :: r :: int"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="BarAtualProgress :: r :: int :: 0 :: 0 :: 100"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="InfoAlign :: o :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4_labels"]="l, r"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4_values"]="left, right"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5"]="InfoData :: o :: string"
}
