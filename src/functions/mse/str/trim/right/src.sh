#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_trim_right() {
  mseLastFunctionVariablesReset

  local mseReturn="$1"
  mseReturn="${mseReturn%"${mseReturn##*[![:space:]]}"}" # trim R

  mseLastFunctionVariablesSet "${mseReturn}" 0 ""
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}