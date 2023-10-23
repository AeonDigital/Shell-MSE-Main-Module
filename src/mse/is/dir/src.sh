#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_is_dir() {
  local mseReturn
  if [ -d "${1}" ]; then mseReturn="1"; else mseReturn="0"; fi
  printf "%s" "${mseReturn}"
}