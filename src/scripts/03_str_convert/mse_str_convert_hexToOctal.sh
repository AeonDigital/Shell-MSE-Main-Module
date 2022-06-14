#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte um 'hex' para seu respectivo 'octal'.
#
# @param charHex $1
# Valor que será convertido.
#
# @return
# Representação 'octal' do 'hex' informado.
#
# @example
#   mse_str_convert_hexToOctal "A1"      # converte para -> 241
#   mse_str_convert_hexToOctal "C3 AD"   # converte para -> "303 255"
#   result=$(mse_str_convert_hexToOctal "A1" 1)
mse_str_convert_hexToOctal() {
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
    mseTmp=$(printf $((16#${mseByte})))
    mseTmp=$(printf "%o" ${mseTmp})
    mseReturn+="${mseTmp}"
  done

  printf "${mseReturn}"
}
MSE_GLOBAL_CMD["str convert hexToOctal"]="mse_str_convert_hexToOctal"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_convert_hexToOctal_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Hex :: r :: charHex"
}
