#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte um 'decimal' para seu respectivo 'octal'.
#
# @param charDecimal $1
# Valor que será convertido.
#
# @return
# Representação 'octal' do 'decimal' informado.
#
# @example
#   mse_str_convert_decimalToOctal "161"       # converte para -> 241
#   mse_str_convert_decimalToOctal "195 173"   # converte para -> "303 255"
#   result=$(mse_str_convert_decimalToOctal "161" 1)
mse_str_convert_decimalToOctal() {
  local mseReturn
  local mseTmp
  local mseByte
  local mseArrParam

  #
  # Esplita o valor inicial em bytes
  # e então converte cada byte remontando o octal final
  mseReturn=""
  mseArrParam=(${1// / })
  for mseByte in "${mseArrParam[@]}"; do
    if [ "${mseReturn}" != "" ]; then
      mseReturn+=' '
    fi
    mseTmp=$(printf "%o" "${mseByte}")
    mseReturn+="${mseTmp}"
  done

  printf "${mseReturn}"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_convert_decimalToOctal_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Decimal :: r :: charDecimal"
}
