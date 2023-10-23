#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_is_bool() {
  local mseReturn
  if [ "${1}" == "0" ] || [ "${1}" == "1" ]; then mseReturn="1"; else mseReturn="0"; fi
  printf "%s" "${mseReturn}"
}