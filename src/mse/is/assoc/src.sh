#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_is_assoc() {
  local mseReturn="0"
  if [[ "$(declare -p "${1}" 2> /dev/null)" == "declare -A"* ]]; then
    mseReturn="1"
  fi
  printf "%s" "${mseReturn}"
}