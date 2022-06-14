#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte um 'char' para seu respectivo 'decimal'.
#
# @param char $1
# Valor que será convertido.
#
# @return
# Representação 'decimal' do 'char' informado.
# Caracteres multibyte retornarão mais de um valor, cada qual representando um
# de seus bytes.
#
# @example
#   mse_str_convert_charToDecimal "í"    # converte para -> "195 173"
#   result=$(mse_str_convert_charToDecimal "í" 1)
mse_str_convert_charToDecimal() {
  local mseReturn
  local mseChar
  local mseCharI

  #
  # Esplita o valor inicial em bytes
  # e então converte cada byte remontando o decimal final
  mseReturn=""
  for (( mseCharI=0; mseCharI<${#1}; mseCharI++ )); do
    mseChar="${1:${mseCharI}:1}"
    if [ "$mseCharI" != "0" ]; then
      mseReturn+=" "
    fi
    mseReturn+=$(printf "%i" "'$mseChar")
  done

  printf "${mseReturn}"
}
MSE_GLOBAL_CMD["str convert charToDecimal"]="mse_str_convert_charToDecimal"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_convert_charToDecimal_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Char :: r :: char"
}
