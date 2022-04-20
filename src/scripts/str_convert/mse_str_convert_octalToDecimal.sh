#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte o valor Octal informado para o respectivo Decimal.
#
# Use múltiplos valores separados por espaços se quiser converter mais de
# um ao mesmo tempo.
#
# @param int $1
# Valor que será convertido.
#
# @example
#   mse_str_convert_octalToDecimal "241"       # converte para -> 161
#   mse_str_convert_octalToDecimal "303 255"   # converte para -> "195 173"
#   result=$(mse_str_convert_octalToDecimal "241" 1)
mse_str_convert_octalToDecimal() {
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
      mseReturn+="${mseTmp}"
    done

    printf "${mseReturn}"
    return 0
  fi
}
