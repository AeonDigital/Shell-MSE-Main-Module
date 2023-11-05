#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Processa as linhas do manual correspondente aos parametros válidos de serem
# usados e suas respectivas regras de uso.
#
# @param string $1
# Coleção de linhas do manual da seção 'parameters' que correspondem aos
# parametros que serão processados.
#
# @return
# Os dados obtidos serão armazenados no array associativo
# 'MSE_MAN_PARAMETERS_DATA'.
# O array 'MSE_MAN_PARAMETERS_ORDER' será usado para manter a informação da
# ordem em que cada parametro aparece no manual.
#
# Ao final do processo as propriedades associadas com cada parametro serão
# adicionadas no array 'MSE_MAN_PARAMETERS_DATA' usando o nome do mesmo como
# prefixo.
# As seguintes propriedades serão preenchidas para cada parametro:
#
# - type
# - name
# - aka
# - default
# - min
# - max
# - options
# - list
# - hint
# - description
#
# Caso alguma propriedade esteja preenchida com algum valor inválido, o mesmo
# será substituido pela constante '!!MSE_ERROR!!'.
#
mse_man_process_parameters() {
  unset MSE_MAN_PARAMETERS_DATA
  declare -Ag MSE_MAN_PARAMETERS_DATA

  unset MSE_MAN_PARAMETERS_ORDER
  declare -ag MSE_MAN_PARAMETERS_ORDER=()


  local mseAllowedTypes=" bool int float char charDecimal charHex charOctal string array assoc regex function file dir mixed void "
  declare -a mseArrAllowedTypes=()
  mse_str_convert_toArray "mseArrAllowedTypes" "${mseAllowedTypes}"

  local mseExpectedProperties=" type name aka default min max options list hint description "
  declare -a mseArrExpectedProperties=()
  mse_str_convert_toArray "mseArrExpectedProperties" "${mseExpectedProperties}"


  local mseRawParametersData="${1}"
  if [ "${mseRawParametersData}" != "" ]; then
    local mseRawDeclaration=""
    local mseParameterType=""
    local mseParameterName=""
    declare -a mseArrSplit=()



    # @@ daqui!
    IFS=$'\n'
    while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
      if [ "${mseLineRaw}" != "" ]; then

        if [[ "${mseLineRaw}" == "## "* ]]; then
          mseRawDeclaration="${mseLineRaw##*# }"
          echo "${mseRawDeclaration}"

          mse_str_split "mseArrSplit" " " "${mseRawDeclaration}" "1" "1"
          if [ "${#mseArrSplit[@]}" != "2" ]; then
            mseParameterType="${MSE_ERROR}"
            mseParameterName="ERROR_${#MSE_MAN_PARAMETERS_ORDER[@]}"
          else
            mseParameterType="${MSE_ERROR}"
            mseParameterName="ERROR_${#MSE_MAN_PARAMETERS_ORDER[@]}"
          fi
        fi

      fi
    done <<< "${mseRawParametersData}"
    IFS=$' \t\n'
  fi
}