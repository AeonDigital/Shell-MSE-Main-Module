#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_is_array() {
  mseLastFunctionVariablesReset

  local mseReturn="0"
  if [[ "$(declare -p ${1} 2> /dev/null)" == "declare -a"* ]]; then
    mseReturn="1"
  fi

  mseLastFunctionVariablesSet "${mseReturn}" 0 ""
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}