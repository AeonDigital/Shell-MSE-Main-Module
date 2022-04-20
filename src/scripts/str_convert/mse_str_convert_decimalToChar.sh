#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte o valor Decimal informado para o respectivo Caracter.
#
# Use múltiplos valores separados por espaços para representar caracteres
# multibyte.
#
# Importante salientar que os caracteres correspondentes aos decimais acima do
# número 127 dependem da fonte sendo usada no terminal e no fato de ele estar
# ou não preparado para usar caracteres UTF-8.
#
# @param int $1
# Valor que será convertido.
#
# @example
#   mse_str_convert_decimalToChar "195 173"    # converte para -> í
#   result=$(mse_str_convert_decimalToChar "195 173" 1)
mse_str_convert_decimalToChar() {
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
    # e então converte cada byte remontando o char final
    mseArrParam=(${1// / })
    for mseByte in "${mseArrParam[@]}"; do
      mseTmp=$(printf "%o" "${mseByte}")
      mseReturn+="\\${mseTmp}"
    done

    printf "${mseReturn}"
    return 0
  fi
}
