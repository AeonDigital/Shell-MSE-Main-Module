#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite identificar se uma função está definida no escopo atual do terminal.
# Printa '1' se sim e '0' se não.
#
# @param string $1
# Nome da função que está sendo verificada.
#
# @return bool
# '1' se a função existir
# '0' se a função não existir
mse_raw_isFunctionExists() {
  local mseReturn=0
  if [ $# -ge 1 ] && [ "$1" != "" ]; then
    if [ "$(type -t $1)" == "function" ]; then mseReturn=1; else mseReturn=0; fi
  fi
  printf "%s" "${mseReturn}"
}