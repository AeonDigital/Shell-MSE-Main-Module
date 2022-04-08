#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Faz o 'join' dos itens de um array usando uma string especial indicada.
# O resultado é 'printado' na tela.
#
# @param string $1
# String que será usada como 'cola' para o join
#
# @param string $2
# Nome do array.
#
# @example
#   myArray=("2022" "12" "22")
#   mse_str_join '-' "myArray"
#   2022-12-22
mse_str_join() {
  local mseArray
  local mseStr
  mseArray="$2[@]"
  mseStr=$(printf '%s'$1 "${!mseArray}")

  if [ "${#mseStr}" -gt 0 ]; then
    mseStr="${mseStr:: -1}"
  fi

  printf "${mseStr}"
}
