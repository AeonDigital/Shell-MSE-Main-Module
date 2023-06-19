#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_is_command() {
  mseLastFunctionVariablesReset

  local mseReturn=0
  $1 &> /dev/null
  if [ $? == 0 ]; then mseReturn=1; else mseReturn=0; fi

  mseLastFunctionVariablesSet "${mseReturn}" 0 ""
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}