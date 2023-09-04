#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_replace_placeHolder() {
  mseLastFunctionVariablesReset

  local msePair="$#"
  ((msePair=msePair-1))

  if [ "$#" -lt "3" ] || [ $((msePair%2)) -ne 0 ]; then
    mseLastFunctionVariablesSet "${MSE_UNDEF}" 1 "${lbl_err_wrongNumberOfArguments}"
  else

    local mseString
    local msePHName
    local msePHValue
    local mseReturn


    if [ "$#" == "3" ]; then
      mseString="$1"
      msePHName="\[\[${2}\]\]"
      msePHValue="$3"
      mseReturn="${mseString//${msePHName}/${msePHValue}}"
      mseLastFunctionVariablesSet "${mseReturn}" 0 ""
    else
      local i
      local v

      local mseTmpParametersArray=("$@")
      mseTmpParametersArray=("${mseTmpParametersArray[@]:1}")

      local mseTotalParans="${#mseTmpParametersArray[@]}"
      mseReturn="$1"

      for ((i=0; i<mseTotalParans; i=i+2)); do
        ((v=i+1))
        if [ "${v}" -lt "${mseTotalParans}" ]; then
          msePHName="${mseTmpParametersArray[$i]}"
          msePHValue="${mseTmpParametersArray[$v]}"
          mseReturn=$(mse_str_replace_placeHolder "${mseReturn}" "${msePHName}" "${msePHValue}")
        fi
      done

      mseLastFunctionVariablesSet "${mseReturn}" 0 ""
    fi
  fi

  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}