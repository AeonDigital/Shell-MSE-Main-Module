#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite identificar se um valor passado é uma string indicada
# representa adequadamente um numeral inteiro.
# Printa '1' se sim e '0' se não.
#
# @param string $1
# Valor que será testado.
mse_mmod_checkIfInteger() {
  local regEx
  regEx='^[0-9]+$'
  if [[ $1 =~ $regEx ]]; then printf "1\n"; else printf "0\n"; fi
}
