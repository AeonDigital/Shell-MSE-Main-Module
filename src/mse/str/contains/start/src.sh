#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_contains_start() {
  local mseReturn="0"
  if [[ "${2}" == "${1}"* ]]; then
    mseReturn="1"
  fi
  printf "%s" "${mseReturn}"
}