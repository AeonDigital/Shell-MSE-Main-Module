#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Substitui toda ocorrencia da string $1 pela
# string $2 encontrada na string definida em $3.
#
# @param string $1
# String antiga (que será substituída).
#
# @param string $2
# String nova (que será adicionada no local da antiga).
#
# @param string $3
# String original. Onde ocorrerá a substituição
#
# @example
#   result=$(mse_str_replace "22" "20" "2022-12-22")
#   printf $result # "2020-12-20"
mse_str_replace() {
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=3
  mseParamRules["param_0"]="Old :: r :: string"
  mseParamRules["param_1"]="New :: r :: string"
  mseParamRules["param_2"]="String :: r :: string"

  mseReturn=$(mse_mmod_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    local mseOld="$1"
    local mseNew="$2"
    local mseString="$3"

    mseReturn="${mseString//${mseOld}/${mseNew}}"

    printf "%s" "${mseReturn}"
    return 0
  fi
}
