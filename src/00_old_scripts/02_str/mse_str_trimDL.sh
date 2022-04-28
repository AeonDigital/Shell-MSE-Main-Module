#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Elimina qualquer espaço em branco existente imediatamente
# ANTES do delimitador indicado.
#
# @param string $1
# Delimitador.
#
# @param string $2
# String que será alterada.
#
# @example
#   result=$(mse_str_trimDL "," "Keep calm   ,   and...")
#   printf $result # "Keep calm,   and..."
mse_str_trimDL() {
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=2
  mseParamRules["param_0"]="Delimiter :: r :: string"
  mseParamRules["param_1"]="String :: r :: string"

  mseReturn=$(mse_exec_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    mseReturn=$(mse_str_trimD "$1" "$2" "l")
    printf "%s" "${mseReturn}"
    return 0
  fi

  #
  # usando 'sed'
  # sed 's/\s*'"$1"'/'"$1"'/g' <<< "$2"
}
