#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Efetua um split na string passada usando o separador indicado.
# O resultado será o preenchimento do array global
# 'MSE_GLOBAL_MODULE_SPLIT'
#
# @param string $1
# Separador
#
# @param string $2
# String original (que será 'esplitada')
#
# @example
#   mse_str_split '-' "2022-12-22"
#   myArray=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
#   =
#   myArray=("2022" "12" "22")
mse_str_split() {
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
    local mseDelimiter="$1"
    local mseString="$2"
    local mseSubStr=""

    unset MSE_GLOBAL_MODULE_SPLIT_RESULT
    declare -ga MSE_GLOBAL_MODULE_SPLIT_RESULT

    while [ "${mseString}" != "" ]; do
      #
      # Não existindo nenhum delimitador...
      if [[ "$mseString" != *"$mseDelimiter"* ]]; then
        MSE_GLOBAL_MODULE_SPLIT_RESULT+=("$mseString")
        break
      else
        mseSubStr="${mseString%%${mseDelimiter}*}"
        MSE_GLOBAL_MODULE_SPLIT_RESULT+=("$mseSubStr")

        mseString="${mseString#*${mseDelimiter}}"
      fi
    done

    return 0
  fi
}
