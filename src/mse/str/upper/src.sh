#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_upper() {
  mseLastFunctionVariablesReset

  local mseReturn=$(printf "%s" "${1^^}")

  mseLastFunctionVariablesSet "${mseReturn}" 0 ""
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}