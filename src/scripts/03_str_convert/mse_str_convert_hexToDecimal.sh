#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte um 'hex' para seu respectivo 'decimal'.
#
# @param charHex $1
# Valor que será convertido.
#
# @return
# Representação 'decimal' do 'hex' informado.
#
# @example
#   mse_str_convert_hexToDecimal "A1"      # converte para -> 161
#   mse_str_convert_hexToDecimal "C3 AD"   # converte para -> "195 173"
#   result=$(mse_str_convert_hexToDecimal "161" 1)
mse_str_convert_hexToDecimal() {
  local mseReturn
  local mseTmp
  local mseByte
  local mseArrParam

  #
  # Esplita o valor inicial em bytes
  # e então converte cada byte remontando o decimal final
  mseReturn=""
  mseArrParam=(${1// / })
  for mseByte in "${mseArrParam[@]}"; do
    if [ "${mseReturn}" != "" ]; then
      mseReturn+=' '
    fi
    mseTmp=$(printf $((16#${mseByte})))
    mseReturn+="${mseTmp}"
  done

  printf "${mseReturn}"
}
MSE_GLOBAL_CMD["str hexToDecimal"]="mse_str_convert_hexToDecimal"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_convert_hexToDecimal_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Hex :: r :: charHex"
}
