#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_is_array() {
  local mseReturn="0"
  if [[ "$(declare -p "${1}" 2> /dev/null)" == "declare -a"* ]]; then
    mseReturn="1"
  fi
  echo -n "${mseReturn}"
}