#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite identificar se uma função está definida no escopo atual do terminal.
# Printa '1' se sim e '0' se não.
#
# @param string $1
# Nome da função que está sendo verificada.
#
# @return bool
# '1' se a função existir
# '0' se a função não existir
mse_check_isFunctionExists() {
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=1
  mseParamRules["param_0"]="FunctionName :: r :: string"

  mseReturn=$(mse_exec_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    if [ "$(type -t $1)" == "function" ]; then mseReturn=1; else mseReturn=0; fi

    printf "%s" "${mseReturn}"
    return 0
  fi
}
