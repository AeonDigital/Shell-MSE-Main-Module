#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_is_file() {
  local mseReturn
  if [ -f "${1}" ]; then mseReturn="1"; else mseReturn="0"; fi
  printf "%s" "${mseReturn}"
}