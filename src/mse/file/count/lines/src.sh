#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_count_lines() {
  mseLastFunctionVariablesReset


  local mseReturn=0
  local mseFileContent="${1}"

  if [ -f "${mseFileContent}" ]; then
    mseFileContent=$(< "${mseFileContent}")
  fi

  if [ "${mseFileContent}" != "" ]; then
    local mseLineRaw

    while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
      ((mseReturn++))
    done <<< "${mseFileContent}"
  fi


  mseLastFunctionVariablesSet "${mseReturn}" 0 ""
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}