#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_array_has_key() {
  local mseReturn
  declare -n assocName="${2}"
  if [ -z "${assocName[${1}]+x}" ]; then mseReturn="0"; else mseReturn="1"; fi
  printf "%s" "${mseReturn}"
}