#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Imprime na tela o valor da variável pesquisada.
#
# Se o arquivo de configuração estiver mal formatado e existir uma variável
# duplicada, apenas a primeira será levada em consideração.
#
# @param string $1
# Caminho até o arquivo que deve ser verificado.
#
# @param string $2
# Nome da variável alvo.
#
# @return
# Printa o valor da variável indicada
mse_conf_showVariableValue()
{
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=2
  mseParamRules["param_0"]="PathToFile :: r :: fileName"
  mseParamRules["param_1"]="VariableName :: r :: string"

  mseReturn=$(mse_exec_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    local mseRawLine
    mseRawLine=$(mse_conf_showVariableLine "$1" "$2")

    if [ "${mseRawLine}" != "" ]; then
      mseRawLine=$(mse_raw_str_trimD "=" "${mseRawLine}")
      printf "${mseRawLine#${2}=}"
    fi
    return 0
  fi
}
