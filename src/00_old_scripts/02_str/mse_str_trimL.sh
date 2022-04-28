#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Elimina qualquer espaço em branco no início da string indicada.
#
# @param string $1
# String que será alterada.
#
# @example
#   result=$(mse_str_trimL "   texto aqui   ")
#   printf $result # "texto aqui   "
mse_str_trimL() {
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=1
  mseParamRules["param_0"]="String :: r :: string"

  mseReturn=$(mse_exec_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    mseReturn="$1"
    mseReturn="${mseReturn#"${mseReturn%%[![:space:]]*}"}" # trim L

    printf "%s" "${mseReturn}"
    return 0
  fi
}
