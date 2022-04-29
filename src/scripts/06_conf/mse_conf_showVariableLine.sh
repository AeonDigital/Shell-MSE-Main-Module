#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Imprime na tela toda a linha informativa sobre a variável de nome indicado.
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
# @param bool $3
# Omita, indique "" ou "0" para retornar apenas as linhas alvo.
# Indique "1" para trazer o número de cada uma das linhas retornadas.
#
# @return
# Printa a linha da variável indicada
mse_conf_showVariableLine()
{
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=3
  mseParamRules["param_0"]="PathToFile :: r :: fileName"
  mseParamRules["param_1"]="VariableName :: r :: string"
  mseParamRules["param_2"]="ShowLineNumber :: o :: bool :: 0"

  mseReturn=$(mse_exec_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    local mseRawSection
    local mseRawLine
    local mseShowLineNumber

    mseShowLineNumber=0
    if [ $# -ge 3 ] && [ $3 == 1 ]; then
      mseShowLineNumber=1
    fi

    mseRawSection=$(mse_conf_showVariables "$1" "$mseShowLineNumber")
    mseRawLine=""

    if [ "$mseRawSection" != "" ]; then
      mse_file_read_resetConfig

      MSE_GLOBAL_MODULE_READ_LINE["check"]="mse_file_read_checkLine_hasVariable"
      MSE_GLOBAL_MODULE_READ_LINE["check_args"]="$2"
      MSE_GLOBAL_MODULE_READ_LINE["check_has_linenumber"]="$mseShowLineNumber"

      unset MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY
      declare -ga MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY=("#" ";")

      mseRawLine=$(mse_file_read "$mseRawSection")
    fi

    printf "${mseRawLine%%[[:cntrl:]]*}"
    return 0
  fi
}
