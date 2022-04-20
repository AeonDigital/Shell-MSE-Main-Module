#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte o valor Octal informado para o respectivo Hexadecimal.
#
# Use múltiplos valores separados por espaços se quiser converter mais de
# um ao mesmo tempo.
#
# @param int $1
# Valor que será convertido.
#
# @param bool $2
# Se omitido, ou se '0' irá retornar o valor convertido e adicionará uma linha
# em branco após a impressão.
# Se '1' retornará apenas o caracter.
#
# @example
#   mse_str_convert_octalToHex "241"       # converte para -> A1
#   mse_str_convert_octalToHex "303 255"   # converte para -> "C3 AD"
#   result=$(mse_str_convert_octalToHex "241" 1)
mse_str_convert_octalToHex() {
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=1
  mseParamRules["param_0"]="Octal :: r :: charOctal"

  mseReturn=$(mse_mmod_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    mseReturn=""
    local mseTmp
    local mseByte
    local mseArrParam

    #
    # Esplita o valor inicial em bytes
    # e então converte cada byte remontando o char final
    mseArrParam=(${1// / })
    for mseByte in "${mseArrParam[@]}"; do
      if [ "$mseReturn" != "" ]; then
        mseReturn+=" "
      fi
      mseTmp=$(printf $((8#${mseByte})))
      mseTmp=$(printf '%X' ${mseTmp})
      mseReturn+="${mseTmp}"
    done

    printf "${mseReturn}"
    return 0
  fi
}
