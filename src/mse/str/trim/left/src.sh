#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_trim_left() {
  mseLastFunctionVariablesReset

  local mseReturn=$(echo -e "${1}")
  mseReturn="${mseReturn#"${mseReturn%%[![:space:]]*}"}" # trim L

  mseLastFunctionVariablesSet "${mseReturn}" 0 ""
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}