#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_replace() {
  mseLastFunctionVariablesReset

  local mseOld="$1"
  local mseNew="$2"
  local mseString="$3"
  local mseReturn="${mseString//${mseOld}/${mseNew}}"

  mseLastFunctionVariablesSet "${mseReturn}" 0 ""
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}