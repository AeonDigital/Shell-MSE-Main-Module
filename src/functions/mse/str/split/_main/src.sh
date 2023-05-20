#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_split() {
  mseLastFunctionVariablesReset

  if [ "$#" -lt "2" ]; then
    mseLastFunctionVariablesSet "${MSE_UNDEF}" 1 "Wrong number of arguments."
  else
    local mseSeparator="$1"
    local mseString="$2"
    local mseSubStr=""
    local mseRemoveEmpty="0"
    local mseTrimElements="0"

    if [ "$#" -ge "3" ] && [ "$3" == "1" ]; then
      mseRemoveEmpty="1"
    fi

    if [ "$#" -ge "4" ] && [ "$4" == "1" ]; then
      mseTrimElements="1"
    fi

    unset MSE_LAST_FUNCTION_RETURN
    declare -ga MSE_LAST_FUNCTION_RETURN


    while [ "${mseString}" != "" ]; do
      if [[ "${mseString}" != *"${mseSeparator}"* ]]; then
        if [ "${mseTrimElements}" == "1" ]; then
          mseString=$(mse_str_trim "${mseString}")
        fi

        MSE_LAST_FUNCTION_RETURN+=("${mseString}")
        break
      else
        mseSubStr="${mseString%%${mseSeparator}*}"

        if [ "${mseTrimElements}" == "1" ]; then
          mseSubStr=$(mse_str_trim "${mseSubStr}")
        fi

        if [ "${mseSubStr}" != "" ] || [ "${mseRemoveEmpty}" == "0" ]; then
          MSE_LAST_FUNCTION_RETURN+=("${mseSubStr}")
        fi

        mseString="${mseString#*${mseSeparator}}"
      fi
    done
  fi

  return ${MSE_LAST_FUNCTION_ERR_CODE}
}