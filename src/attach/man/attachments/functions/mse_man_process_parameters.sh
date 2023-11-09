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
# Esta função não efetua a validação dos valores indicados no manual
# portanto os valores podem sim estar definidos de forma errada.
#
# @return void
mse_man_process_parameters() {
  unset MSE_MAN_PARAMETERS_DATA
  declare -Ag MSE_MAN_PARAMETERS_DATA

  unset MSE_MAN_PARAMETERS_ORDER
  declare -ag MSE_MAN_PARAMETERS_ORDER=()



  local mseAllowedTypes=" bool int float char charDecimal charHex charOctal string array assoc regex function file dir mixed void "
  declare -a mseArrAllowedTypes=()
  mse_str_convert_toArray "mseArrAllowedTypes" "${mseAllowedTypes}"

  local mseExpectedProperties=" type name aka default min max options 'options cs' 'options ci' list 'list cl' 'list op' hint description "
  declare -a mseArrExpectedProperties=()
  mse_str_convert_toArray "mseArrExpectedProperties" "${mseExpectedProperties}"



  local mseRawParametersData="${1}"
  if [ "${mseRawParametersData}" != "" ]; then
    local mseTmpResult=""
    declare -a mseArrSplit=()

    local mseParameterType=""
    local mseParameterName=""
    local mseParameterPropertyName=""
    local mseParameterPropertyValue=""
    local mseParameterPropertyValueSubList="0"
    local mseParameterPropertyFirstLine="0"

    local mseAtualOrder="${#MSE_MAN_PARAMETERS_ORDER[@]}"


    IFS=$'\n'
    while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
      if [[ "${mseLineRaw}" == "## "* ]]; then
        mse_str_split "mseArrSplit" " " "${mseLineRaw##*# }" "1" "1"
        if [ "${#mseArrSplit[@]}" != "2" ]; then
          MSE_MAN_PARAMETERS_DATA["ERROR_${mseAtualOrder}"]="${MSE_ERROR}"
          MSE_MAN_PARAMETERS_ORDER+=("ERROR_${mseAtualOrder}")
          mseAtualOrder="${#MSE_MAN_PARAMETERS_ORDER[@]}"

          mseParameterType=""
          mseParameterName=""
        else
          mseParameterType="${mseArrSplit[0]}"
          mseParameterName="${mseArrSplit[1]}"

          MSE_MAN_PARAMETERS_DATA["${mseParameterName}"]="${mseAtualOrder}"
          MSE_MAN_PARAMETERS_DATA["${mseParameterName}_name"]="${mseParameterName}"
          MSE_MAN_PARAMETERS_DATA["${mseParameterName}_type"]="${mseParameterType}"
          MSE_MAN_PARAMETERS_DATA["${mseParameterName}_aka"]="${MSE_NULL}"
          MSE_MAN_PARAMETERS_DATA["${mseParameterName}_default"]="${MSE_NULL}"
          MSE_MAN_PARAMETERS_DATA["${mseParameterName}_min"]="${MSE_NULL}"
          MSE_MAN_PARAMETERS_DATA["${mseParameterName}_max"]="${MSE_NULL}"
          MSE_MAN_PARAMETERS_DATA["${mseParameterName}_options_ci"]="${MSE_NULL}"
          MSE_MAN_PARAMETERS_DATA["${mseParameterName}_options_cs"]="${MSE_NULL}"
          MSE_MAN_PARAMETERS_DATA["${mseParameterName}_list_cl"]="${MSE_NULL}"
          MSE_MAN_PARAMETERS_DATA["${mseParameterName}_list_op"]="${MSE_NULL}"
          MSE_MAN_PARAMETERS_DATA["${mseParameterName}_hint"]="${MSE_NULL}"
          MSE_MAN_PARAMETERS_DATA["${mseParameterName}_description"]="${MSE_NULL}"

          MSE_MAN_PARAMETERS_ORDER+=("${mseParameterName}")
          mseAtualOrder="${#MSE_MAN_PARAMETERS_ORDER[@]}"
        fi
      else
        if [ "${mseParameterName}" != "" ]; then
          mseParameterPropertyFirstLine="0"

          if [[ "${mseLineRaw}" == "- "* ]]; then
            if [ "${mseParameterPropertyName}" != "description" ]; then
              mseParameterPropertyName=""
              mseParameterPropertyValueSubList="0"
            fi


            mse_str_split "mseArrSplit" ":" "${mseLineRaw#- }" "0" "1"
            if [ "${#mseArrSplit[@]}" == "2" ]; then
              mseTmpResult=$(mse_array_has_value "${mseArrSplit[0]}" "mseArrExpectedProperties" "1")
              if [ "${mseTmpResult}" == "1" ]; then
                mseParameterPropertyName="${mseArrSplit[0]}"
                mseParameterPropertyValue="${mseArrSplit[1]}"
                mseParameterPropertyFirstLine="1"


                if [ "${mseParameterPropertyName}" == "options" ] || [ "${mseParameterPropertyName}" == "options ci" ]; then
                  mseParameterPropertyName="options_ci"
                elif [ "${mseParameterPropertyName}" == "options cs" ]; then
                  mseParameterPropertyName="options_cs"
                fi
                if [ "${mseParameterPropertyName}" == "list" ] || [ "${mseParameterPropertyName}" == "list cl" ]; then
                  mseParameterPropertyName="list_cl"
                elif [ "${mseParameterPropertyName}" == "list op" ]; then
                  mseParameterPropertyName="list_op"
                fi


                if [ "${mseParameterPropertyValue}" == "MSE_NULL" ]; then
                  mseParameterPropertyValue="${MSE_NULL}"
                elif [ "${mseParameterPropertyValue}" == "MSE_UNDEF" ]; then
                  mseParameterPropertyValue="${MSE_UNDEF}"
                fi
              fi
            fi


          fi


          if [ "${mseParameterPropertyName}" != "" ]; then

            if [[ "${mseParameterPropertyValueSubList}" == "1" ]]; then
              if [[ "${mseLineRaw}" == "  - "* ]]; then
                mseParameterPropertyValue=$(mse_str_trim "${mseLineRaw#  - }")
              fi
            fi



            case "${mseParameterPropertyName}" in
              "aka")
                MSE_MAN_PARAMETERS_DATA["${mseParameterName}_aka"]="${mseParameterPropertyValue}"
                mseParameterPropertyName=""
              ;;
              "default")
                MSE_MAN_PARAMETERS_DATA["${mseParameterName}_default"]="${mseParameterPropertyValue}"
                mseParameterPropertyName=""
              ;;
              "min")
                MSE_MAN_PARAMETERS_DATA["${mseParameterName}_min"]="${mseParameterPropertyValue}"
                mseParameterPropertyName=""
              ;;
              "max")
                MSE_MAN_PARAMETERS_DATA["${mseParameterName}_max"]="${mseParameterPropertyValue}"
                mseParameterPropertyName=""
              ;;
              "options_ci" | "options_cs" | "list_cl" | "list_op")
                mseParameterPropertyValueSubList="1"
                if [ "${mseParameterPropertyFirstLine}" == "1" ]; then
                  MSE_MAN_PARAMETERS_DATA["${mseParameterName}_${mseParameterPropertyName}"]=""
                fi

                if [ "${mseParameterPropertyValue}" != "" ]; then
                  MSE_MAN_PARAMETERS_DATA["${mseParameterName}_${mseParameterPropertyName}"]+="\n${mseParameterPropertyValue}"
                fi
              ;;
              "hint")
                if [ "${mseParameterPropertyFirstLine}" == "1" ]; then
                  MSE_MAN_PARAMETERS_DATA["${mseParameterName}_hint"]=""
                else
                  mseTmpResult=$(mse_str_trim "${mseLineRaw}")
                  if [ "${mseTmpResult}" == "" ]; then
                    mseParameterPropertyName="description"
                    MSE_MAN_PARAMETERS_DATA["${mseParameterName}_description"]=""
                  else
                    MSE_MAN_PARAMETERS_DATA["${mseParameterName}_hint"]+="\n${mseTmpResult}"
                  fi
                fi
              ;;
              "description")
                mseTmpResult=$(mse_str_trim "${mseLineRaw}")
                if [ "${MSE_MAN_PARAMETERS_DATA["${mseParameterName}_description"]}" != "" ] || [ "${mseTmpResult}" != "" ]; then
                  MSE_MAN_PARAMETERS_DATA["${mseParameterName}_description"]+="\n${mseTmpResult}"
                fi
              ;;
            esac
          fi
        fi
      fi
    done <<< "${mseRawParametersData}"
    IFS=$' \t\n'


    local mseV
    for mseV in "${MSE_MAN_PARAMETERS_ORDER[@]}"; do
      if [ "${MSE_MAN_PARAMETERS_DATA["${mseV}_hint"]}" != "" ]; then
        MSE_MAN_PARAMETERS_DATA["${mseV}_hint"]=$(mse_str_trim "${MSE_MAN_PARAMETERS_DATA["${mseV}_hint"]}")
      fi
      if [ "${MSE_MAN_PARAMETERS_DATA["${mseV}_hint"]}" != "" ]; then
        MSE_MAN_PARAMETERS_DATA["${mseV}_description"]=$(mse_str_trim "${MSE_MAN_PARAMETERS_DATA["${mseV}_description"]}")
      fi
    done
  fi
}