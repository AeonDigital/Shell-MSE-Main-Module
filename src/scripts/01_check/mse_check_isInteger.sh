#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite identificar se um valor passado é uma string indicada
# representa adequadamente um numeral inteiro.
#
# @param string $1
# Valor que será testado.
#
# @return
# '1' se 'true'
# '0' se 'false'
mse_check_isInteger() {
  local mseReturn
  local regEx

  regEx='^[-]?[0-9]+$'
  if [[ "$1" =~ $regEx ]]; then mseReturn=1; else mseReturn=0; fi

  printf "%s" "${mseReturn}"
}
