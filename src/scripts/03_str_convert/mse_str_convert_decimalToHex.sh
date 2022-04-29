#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte um 'decimal' para seu respectivo 'hex'.
#
# @param charDecimal $1
# Valor que será convertido.
#
# @return
# Representação 'hex' do 'decimal' informado.
#
# @example
#   mse_str_convert_decimalToHex "161"       # converte para -> A1
#   mse_str_convert_decimalToHex "195 173"   # converte para -> "C3 AD"
#   result=$(mse_str_convert_decimalToHex "161" 1)
mse_str_convert_decimalToHex() {
  local mseReturn
  local mseTmp
  local mseByte
  local mseArrParam

  #
  # Esplita o valor inicial em bytes
  # e então converte cada byte remontando o hex final
  mseReturn=""
  mseArrParam=(${1// / })
  for mseByte in "${mseArrParam[@]}"; do
    if [ "${mseReturn}" != "" ]; then
      mseReturn+=' '
    fi
    mseTmp=$(printf "%X" "${mseByte}")
    mseReturn+="${mseTmp}"
  done

  printf "${mseReturn}"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_convert_decimalToHex_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Decimal :: r :: charDecimal"
}
