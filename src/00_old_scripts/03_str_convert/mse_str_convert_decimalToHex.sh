#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte o valor Decimal informado para o respectivo Hexadecimal.
#
# Use múltiplos valores separados por espaços se quiser converter mais de
# um ao mesmo tempo.
#
# @param int $1
# Valor que será convertido.
#
# @example
#   mse_str_convert_decimalToHex "161"       # converte para -> A1
#   mse_str_convert_decimalToHex "195 173"   # converte para -> "C3 AD"
#   result=$(mse_str_convert_decimalToHex "161" 1)
mse_str_convert_decimalToHex() {
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=1
  mseParamRules["param_0"]="Decimal :: r :: charDecimal"

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
    # e então converte cada byte remontando o hex final
    mseArrParam=(${1// / })
    for mseByte in "${mseArrParam[@]}"; do
      if [ "${mseReturn}" != "" ]; then
        mseReturn+=' '
      fi
      mseTmp=$(printf "%X" "${mseByte}")
      mseReturn+="${mseTmp}"
    done

    printf "${mseReturn}"
    return 0
  fi
}
