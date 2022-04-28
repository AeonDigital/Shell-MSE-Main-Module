#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Faz o 'join' dos itens de um array usando uma string especial indicada.
#
# @param string $1
# String que será usada como 'cola' para o join
#
# @param string $2
# Nome do array.
#
# @return
# Printa os valores do array separados pela string definida em $1.
#
# @example
#   myArray=("2022" "12" "22")
#   mse_str_join '-' "myArray"
#   2022-12-22
mse_str_join() {
  local mseGlue
  local mseGlueLen

  mseGlue="$1"
  mseGlueLen="${#mseGlue}"

  declare -n mseArrayName="$2"
  mseReturn=$(printf '%s'$1 "${mseArrayName[@]}")

  if [ $mseGlueLen -gt 0 ]; then
    mseReturn="${mseReturn:: -$mseGlueLen}"
  fi

  printf "%s" "${mseReturn}"
}
