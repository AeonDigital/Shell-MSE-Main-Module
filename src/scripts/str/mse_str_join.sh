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
  local mseReturn

  declare -a mseParamData=($@)
  declare -A mseParamRules
  mseParamRules["count"]=2
  mseParamRules["param_0"]="Glue :: r :: string"
  mseParamRules["param_1"]="ArrayName :: r :: arrayName"

  mseReturn=$(mse_mmod_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    local mseGlue="$1"
    local mseGlueLen="${#mseGlue}"
    declare -n mseArrayName="$2"
    mseReturn=$(printf '%s'$1 "${mseArrayName[@]}")

    if [ $mseGlueLen -gt 0 ]; then
      mseReturn="${mseReturn:: -$mseGlueLen}"
    fi

    printf "%s" "${mseReturn}"
    return 0
  fi
}
