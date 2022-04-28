#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte o argumento passado para minúsculas.
#
# @param string $1
# String que será convertida
#
# @example
#   result=$(mse_str_toLowerCase "TEXT")
mse_str_toLowerCase() {
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=1
  mseParamRules["param_0"]="String :: r :: string"

  mseReturn=$(mse_mmod_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    printf "%s" "${1,,}"
    return 0
  fi
}
