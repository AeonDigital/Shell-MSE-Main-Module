#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_is_int() {
  local mseReturn
  local regEx

  regEx='^[-]?[0-9]+$'
  if [[ "${1}" =~ $regEx ]]; then mseReturn="1"; else mseReturn="0"; fi

  printf "%s" "${mseReturn}"
}