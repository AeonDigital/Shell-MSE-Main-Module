#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# A partir de um comando que executa um programa, identifica
# se o mesmo está disponível para uso.
#
# @param string $1
# Comando que será usado para testar a disponibilidade do programa
# É recomendado o uso de algum comando de baixo impacto como os
# típicos '-v | --version'
#
# @return bool
# '1' se o comando existir
# '0' se o comando não existir
mse_check_isCommandExists() {
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=1
  mseParamRules["param_0"]="Command :: r :: string"

  mseReturn=$(mse_mmod_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    $1 &> /dev/null
    if [ $? == 0 ]; then mseReturn=1; else mseReturn=0; fi

    printf "%s" "${mseReturn}"
    return 0
  fi
}
