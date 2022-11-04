#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte um 'char' para seu respectivo 'hex'.
#
# @param char $1
# Valor que será convertido.
#
# @return
# Representação 'hex' do 'char' informado.
# Caracteres multibyte retornarão mais de um valor, cada qual representando um
# de seus bytes.
#
# @example
#   mse_str_convert_charToHex "í"    # converte para -> "C3 AD"
#   result=$(mse_str_convert_charToHex "í" 1)
mse_str_convert_charToHex() {
  local mseReturn
  local mseChar
  local mseCharI

  #
  # A alteração do "LC_CTYPE" abaixo
  # resolve a contagem de caracteres multibyte/UTF8
  local oLC_CTYPE="${LC_CTYPE}"
  LC_CTYPE="C"

  #
  # Esplita o valor inicial em bytes
  # e então converte cada byte remontando o hex final
  mseReturn=""
  for (( mseCharI=0; mseCharI<${#1}; mseCharI++ )); do
    mseChar="${1:${mseCharI}:1}"
    if [ "$mseCharI" != "0" ]; then
      mseReturn+=" "
    fi
    mseReturn+=$(printf "%X" "'$mseChar")
  done

  LC_CTYPE="${oLC_CTYPE}"
  printf "${mseReturn}"
}
MSE_GLOBAL_CMD["str convert charToHex"]="mse_str_convert_charToHex"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_convert_charToHex_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Char :: r :: char"
}
