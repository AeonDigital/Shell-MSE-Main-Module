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
#
# @return bool
# '1' se o valor é um numeral inteiro
# '0' se o valor não é um numeral inteiro
mse_check_isInteger() {
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=1
  mseParamRules["param_0"]="Value :: r :: string"

  mseReturn=$(mse_mmod_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    local regEx
    regEx='^[-]?[0-9]+$'
    if [[ $1 =~ $regEx ]]; then mseReturn=1; else mseReturn=0; fi

    printf "%s" "${mseReturn}"
    return 0
  fi
}
