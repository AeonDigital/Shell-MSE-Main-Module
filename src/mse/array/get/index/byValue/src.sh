#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_array_get_index_byValue() {
  mseLastFunctionVariablesReset

  local mseCaseSensitive=1
  if [ $# -ge 3 ] && [ "$3" == "0" ]; then
    mseCaseSensitive=0
  fi

  local mseReturn=$(mse_main_array_search "${1}" "${2}" "${mseCaseSensitive}" "0" "0" "1")

  mseLastFunctionVariablesSet "${mseReturn}" 0 ""
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}