#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte um 'char' para seu respectivo 'octal'.
#
# @param char $1
# Valor que será convertido.
#
# @return
# Representação 'octal' do 'char' informado.
# Caracteres multibyte retornarão mais de um valor, cada qual representando um
# de seus bytes.
#
# @example
#   mse_str_convert_charToOctal "í"    # converte para -> "303 255"
#   result=$(mse_str_convert_charToOctal "í" 1)
mse_str_convert_charToOctal() {
  local mseReturn
  local mseChar
  local mseCharI

  #
  # Esplita o valor inicial em bytes
  # e então converte cada byte remontando o octal final
  mseReturn=""
  for (( mseCharI=0; mseCharI<${#1}; mseCharI++ )); do
    mseChar="${1:${mseCharI}:1}"
    if [ "$mseCharI" != "0" ]; then
      mseReturn+=" "
    fi
    mseReturn+=$(printf "%03o" "'$mseChar")
  done

  printf "${mseReturn}"
}
MSE_GLOBAL_CMD["str convert charToOctal"]="mse_str_convert_charToOctal"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_convert_charToOctal_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Char :: r :: char"
}
