#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte um 'decimal' para seu respectivo 'char'.
#
# @param charDecimal $1
# Valor que será convertido.
#
# @return
# Representação 'char' do 'decimal' informado.
#
# @example
#   mse_str_convert_decimalToChar "195 173"    # converte para -> í
#   result=$(mse_str_convert_decimalToChar "195 173" 1)
mse_str_convert_decimalToChar() {
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
    mseTmp=$(printf "%o" "${mseByte}")
    mseReturn+="\\${mseTmp}"
  done

  printf "${mseReturn}"
}
MSE_GLOBAL_CMD["str convert decimalToChar"]="mse_str_convert_decimalToChar"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_convert_decimalToChar_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Decimal :: r :: charDecimal"
}
