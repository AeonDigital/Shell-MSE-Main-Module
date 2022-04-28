#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte/decompõe o valor Char informado para o respectivo Octal.
#
# Caracteres multibyte retornarão mais de um octal, cada qual representando um
# de seus bytes.
#
# @param int $1
# Valor que será convertido.
#
# @example
#   mse_str_convert_charToOctal "í"    # converte para -> "303 255"
#   result=$(mse_str_convert_charToOctal "í" 1)
mse_str_convert_charToOctal() {
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=1
  mseParamRules["param_0"]="Char :: r :: char"

  mseReturn=$(mse_exec_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    mseReturn=""
    local mseChar
    local mseCharI

    #
    # Esplita o valor inicial em bytes
    # e então converte cada byte remontando o octal final
    for (( mseCharI=0; mseCharI<${#1}; mseCharI++ )); do
      mseChar="${1:${mseCharI}:1}"
      if [ "$mseCharI" != "0" ]; then
        mseReturn+=" "
      fi
      mseReturn+=$(printf '%03o' "'$mseChar")
    done

    printf "${mseReturn}"
    return 0
  fi
}
