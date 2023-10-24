#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_contains() {
  local mseReturn="0"
  if [[ "${2}" == *"${1}"* ]]; then
    mseReturn="1"
  fi
  echo -n "${mseReturn}"
}