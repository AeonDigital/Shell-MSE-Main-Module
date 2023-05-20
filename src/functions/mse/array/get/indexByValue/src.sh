#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_array_get_indexByValue() {
  mseLastFunctionVariablesReset

  local mseCaseInsensitive=0
  if [ $# -ge 3 ] && [ "$3" == "1" ]; then
    mseCaseInsensitive=1
  fi

  local mseReturn=$(mse_main_array_search "${1}" "${2}" "${mseCaseInsensitive}" "1")

  mseLastFunctionVariablesSet "${mseReturn}" 0 ""
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}