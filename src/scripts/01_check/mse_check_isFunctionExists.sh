#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite identificar se o nome da função passada está definida no escopo
# atual do terminal.
#
# @param string $1
# Valor que será testado.
#
# @return
# '1' se 'true'
# '0' se 'false'
mse_check_isFunctionExists() {
  local mseReturn

  if [ "$(type -t $1)" == "function" ]; then mseReturn=1; else mseReturn=0; fi

  printf "%s" "${mseReturn}"
}
