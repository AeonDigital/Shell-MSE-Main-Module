#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte um 'octal' para seu respectivo 'char'.
#
# @param charOctal $1
# Valor que será convertido.
#
# @return
# Representação 'char' do 'octal' informado.
#
# @example
#   mse_str_convert_octalToChar "303 255"    # converte para -> í
#   result=$(mse_str_convert_octalToChar "303 255" 1)
mse_str_convert_octalToChar() {
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
    mseReturn+="\\${mseByte[$i]}"
  done

  printf "${mseReturn}"
}
MSE_GLOBAL_CMD["str convert octalToChar"]="mse_str_convert_octalToChar"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_convert_octalToChar_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Octal :: r :: charOctal"
}
