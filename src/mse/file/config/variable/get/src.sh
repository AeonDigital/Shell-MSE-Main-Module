#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_config_variable_get() {
  local mseReturn=$(mse_file_config_variable_showLine "${1}" "${2}" "${3}" "0")
  if [ "${mseReturn}" != "" ]; then
    mseReturn=$(mse_str_trim_substring "=" "${mseReturn}")
    mseReturn=$(echo -ne "${mseReturn#${3}=}")
  fi
  echo -n "${mseReturn}"
}