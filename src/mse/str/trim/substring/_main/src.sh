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
    local mseTrimType="${3}"

    if [ "${3}" == "" ] || ([ "${3}" != "r" ] && [ "${3}" != "l" ]); then
      mseTrimType="b"
    fi


    i=0
    ((li = mseArrLen - 1))
    mseArrElemOne=$(echo -e "${mseArrTmp[$ii]}")
    mseArrElemLas=$(echo -e "${mseArrTmp[$li]}")

    if [ "${mseTrimType}" == "b" ] || [ "${mseTrimType}" == "l" ]; then
      mseArrTmp[$ii]="${mseArrElemOne%"${mseArrElemOne##*[![:space:]]}"}" # trim R
    fi
    if [ "${mseTrimType}" == "b" ] || [ "${mseTrimType}" == "r" ]; then
      mseArrTmp[$li]="${mseArrElemLas#"${mseArrElemLas%%[![:space:]]*}"}" # trim L
    fi


    if [ "${mseArrLen}" -gt "2" ]; then
      for (( i=1; i<li; i++ )); do
        elem=$(echo -e "${mseArrTmp[$i]}")

        if [ "${mseTrimType}" == "b" ] || [ "${mseTrimType}" == "l" ]; then
          elem="${elem%"${elem##*[![:space:]]}"}" # trim R
        fi
        if [ "${mseTrimType}" == "b" ] || [ "${mseTrimType}" == "r" ]; then
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