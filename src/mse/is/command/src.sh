#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_is_command() {
  local mseReturn="0"

  ${1} &> /dev/null
  if [ "$?" == "0" ]; then mseReturn="1"; else mseReturn="0"; fi

  printf "%s" "${mseReturn}"
}