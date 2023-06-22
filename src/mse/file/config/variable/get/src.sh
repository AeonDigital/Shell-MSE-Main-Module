#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_config_variable_get() {
  mseLastFunctionVariablesReset

  local mseReturn=$(mse_file_config_variable_showLine "${1}" "${2}" "${3}" "0")
  if [ "${mseReturn}" != "" ]; then
    mseReturn=$(mse_str_trim_substring "=" "${mseReturn}")
    mseReturn=$(printf "${mseReturn#${3}=}")
  fi

  mseLastFunctionVariablesSet "${mseReturn}" 0 ""
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}