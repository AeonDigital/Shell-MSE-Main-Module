#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_trim() {
  mseLastFunctionVariablesReset

  local mseReturn=$(echo -e "${1}")
  mseReturn="${mseReturn#"${mseReturn%%[![:space:]]*}"}" # trim L
  mseReturn="${mseReturn%"${mseReturn##*[![:space:]]}"}" # trim R

  # with 'sed'
  # local mseReturn=$(echo "${1}" | sed -z -E -e 's/^[ \t\r\n]+//' | sed -z -E -e 's/[ \t\r\n]+$//')

  mseLastFunctionVariablesSet "${mseReturn}" 0 ""
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}