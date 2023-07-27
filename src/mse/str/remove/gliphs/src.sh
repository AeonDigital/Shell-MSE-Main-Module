#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_remove_glyphs() {
  mseLastFunctionVariablesReset

  local mseReturn=$(printf "${1}" | iconv -f 'UTF8' -t 'ASCII//TRANSLIT')

  mseLastFunctionVariablesSet "${mseReturn}" 0 ""
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}