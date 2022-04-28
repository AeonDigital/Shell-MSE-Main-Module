#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte o valor Hexadecimal informado para o respectivo Decimal.
#
# Use múltiplos valores separados por espaços se quiser converter mais de
# um ao mesmo tempo.
#
# @param int $1
# Valor que será convertido.
#
# @example
#   mse_str_convert_hexToDecimal "A1"      # converte para -> 161
#   mse_str_convert_hexToDecimal "C3 AD"   # converte para -> "195 173"
#   result=$(mse_str_convert_hexToDecimal "161" 1)
mse_str_convert_hexToDecimal() {
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=1
  mseParamRules["param_0"]="Hex :: r :: charHex"

  mseReturn=$(mse_exec_validateParams "mseParamRules" "mseParamData")
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
    # e então converte cada byte remontando o decimal final
    mseArrParam=(${1// / })
    for mseByte in "${mseArrParam[@]}"; do
      if [ "${mseReturn}" != "" ]; then
        mseReturn+=' '
      fi
      mseTmp=$(printf $((16#${mseByte})))
      mseReturn+="${mseTmp}"
    done

    printf "${mseReturn}"
    return 0
  fi
}
