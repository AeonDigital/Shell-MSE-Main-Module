#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte um 'hex' para seu respectivo 'char'.
#
# @param charHex $1
# Valor que será convertido.
#
# @return
# Representação 'char' do 'hex' informado.
#
# @example
#   mse_str_convert_hexToChar "C3 AD"    # converte para -> í
#   result=$(mse_str_convert_hexToChar "C3 AD" 1)
mse_str_convert_hexToChar() {
  local mseReturn
  local mseTmp
  local mseByte
  local mseArrParam

  #
  # Esplita o valor inicial em bytes
  # e então converte cada byte remontando o char final
  mseReturn=""
  mseArrParam=(${1// / })
  for mseByte in "${mseArrParam[@]}"; do
    mseTmp=$(printf $((16#${mseByte})))
    mseTmp=$(printf "%o" ${mseTmp})
    mseReturn+="\\${mseTmp}"
  done

  printf "${mseReturn}"
}
MSE_GLOBAL_CMD["str hexToChar"]="mse_str_convert_hexToChar"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_convert_hexToChar_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Hex :: r :: charHex"
}
