#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_array_ifhas_index() {
  mseLastFunctionVariablesReset

  local mseReturn

  declare -n assocName="$2"
  if [ -z "${assocName[$1]+x}" ]; then mseReturn=0; else mseReturn=1; fi

  mseLastFunctionVariablesSet "${mseReturn}" 0 ""
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}