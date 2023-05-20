#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_trim_substring() {
  local mseReturn="${2}"
  mse_str_split "${1}" "${2}"

  local mseArrTmp=("${MSE_LAST_FUNCTION_RETURN[@]}")
  local mseArrLen="${#mseArrTmp[@]}"


  mseLastFunctionVariablesReset


  if [ "${mseArrLen}" -gt "0" ]; then
    local i
    local ii
    local li
    local elem
    local mseArrElemOne
    local mseArrElemLas
    local mseTrimType

    i=0
    ((li = mseArrLen - 1))
    mseArrElemOne="${mseArrTmp[$ii]}"
    mseArrElemLas="${mseArrTmp[$li]}"

    mseTrimType="both"
    if [ "$#" -ge "3" ]; then
      if [ "${3,,}" == "r" ]; then
        mseTrimType="right"
      elif [ "${3,,}" == "l" ]; then
        mseTrimType="left"
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


    if [ "${mseArrLen}" -gt "2" ]; then
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


  mseReturn=$(mse_str_join "${1}" "mseArrTmp")
  mseLastFunctionVariablesSet "${mseReturn}" 0 ""
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}