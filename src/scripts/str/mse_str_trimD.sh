#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Elimina qualquer espaço em branco existente imediatamente
# ANTES e APÓS o delimitador indicado.
#
# @param string $1
# Delimitador.
#
# @param string $2
# String que será alterada.
#
# @param string $3
# Se definido, deve ser informado apenas:
#   r : para efetuar um 'trim' apenas à direita do separador
#   l : para efetuar um 'trim' apenas à esquerda do separador
#   Qualquer outro valor será ignorado
#
# @example
#   result=$(mse_str_trimD ":" "  Keep  calm   :   and   ... :   think  ")
#   printf $result # "  Keep  calm:and   ...:think"
mse_str_trimD() {
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=3
  mseParamRules["param_0"]="Delimiter :: r :: string"
  mseParamRules["param_1"]="String :: r :: string"
  mseParamRules["param_2"]="Type :: o :: list :: both"
  mseParamRules["param_2_labels"]="right, left, both"
  mseParamRules["param_2_values"]="r, l, b"

  mseReturn=$(mse_mmod_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    local mseArrTmp
    local mseArrLen
    local mseArrLen

    mseReturn="$2"
    mse_str_split "$1" "$2"
    mseArrTmp=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
    mseArrLen="${#mseArrTmp[@]}"


    if [ $mseArrLen -gt 0 ]; then
      local i
      local ii
      local li
      local elem
      local mseArrElemOne
      local mseArrElemLas
      local mseTrimType

      i=0
      ((li=mseArrLen-1))
      mseArrElemOne="${mseArrTmp[$ii]}"
      mseArrElemLas="${mseArrTmp[$li]}"

      mseTrimType='both'
      if [ $# -ge 3 ]; then
        if [ "${3,,}" == "r" ] || [ "${3,,}" == "right" ]; then
          mseTrimType='right'
        elif [ "${3,,}" == "l" ] || [ "${3,,}" == "left" ]; then
          mseTrimType='left'
        fi
      fi

      if [ "${mseTrimType}" == "both" ] || [ "${mseTrimType}" == "left" ]; then
        # Efetua um 'trimR' no primeiro ítem
        mseArrTmp[$ii]="${mseArrElemOne%"${mseArrElemOne##*[![:space:]]}"}" # trim R
      fi
      if [ "${mseTrimType}" == "both" ] || [ "${mseTrimType}" == "right" ]; then
        # Efetua um 'trimL' no último ítem
        mseArrTmp[$li]="${mseArrElemLas#"${mseArrElemLas%%[![:space:]]*}"}" # trim L
      fi


      if [ $mseArrLen -gt 2 ]; then
        #
        # aplica o 'trim' 'L' e 'R' em todos os itens 'do meio' do array
        for (( i=1; i<li; i++ )); do
          elem="${mseArrTmp[$i]}"

          if [ "${mseTrimType}" == "both" ] || [ "${mseTrimType}" == "left" ]; then
            elem="${elem%"${elem##*[![:space:]]}"}" # trim R
          fi
          if [ "${mseTrimType}" == "both" ] || [ "${mseTrimType}" == "right" ]; then
            elem="${elem#"${elem%%[![:space:]]*}"}" # trim L
          fi

          mseArrTmp[$i]="${elem}"
        done
      fi
    fi



    mseReturn=$(mse_str_join "$1" "mseArrTmp")
    printf "%s" "${mseReturn}"
    return 0
  fi

  #
  # usando 'sed'
  # sed 's/\s*'"$1"'\s*/'"$1"'/g' <<< "$2"
}
