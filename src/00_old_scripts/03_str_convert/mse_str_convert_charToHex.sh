#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte/decompõe o valor Char informado para o respectivo Hexadecimal.
#
# Caracteres multibyte retornarão mais de um hexadecimal, cada qual representando um
# de seus bytes.
#
# @param int $1
# Valor que será convertido.
#
# @example
#   mse_str_convert_charToHex "í"    # converte para -> "C3 AD"
#   result=$(mse_str_convert_charToHex "í" 1)
mse_str_convert_charToHex() {
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=1
  mseParamRules["param_0"]="Char :: r :: char"

  mseReturn=$(mse_mmod_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    mseReturn=""
    local mseChar
    local mseCharI

    #
    # Esplita o valor inicial em bytes
    # e então converte cada byte remontando o hex final
    for (( mseCharI=0; mseCharI<${#1}; mseCharI++ )); do
      mseChar="${1:${mseCharI}:1}"
      if [ "$mseCharI" != "0" ]; then
        mseReturn+=" "
      fi
      mseReturn+=$(printf '%X' "'$mseChar")
    done

    printf "${mseReturn}"
    return 0
  fi
}
