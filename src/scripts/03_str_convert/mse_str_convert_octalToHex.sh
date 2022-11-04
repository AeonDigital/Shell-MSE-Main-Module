#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte um 'octal' para seu respectivo 'hex'.
#
# @param charOctal $1
# Valor que será convertido.
#
# @return
# Representação 'hex' do 'octal' informado.
#
# @example
#   mse_str_convert_octalToHex "241"       # converte para -> A1
#   mse_str_convert_octalToHex "303 255"   # converte para -> "C3 AD"
#   result=$(mse_str_convert_octalToHex "241" 1)
mse_str_convert_octalToHex() {
  local mseReturn
  local mseTmp
  local mseByte
  local mseArrParam

  #
  # A alteração do "LC_CTYPE" abaixo
  # resolve a contagem de caracteres multibyte/UTF8
  local oLC_CTYPE="${LC_CTYPE}"
  LC_CTYPE="C"

  #
  # Esplita o valor inicial em bytes
  # e então converte cada byte remontando o char final
  mseReturn=""
  mseArrParam=(${1// / })
  for mseByte in "${mseArrParam[@]}"; do
    if [ "$mseReturn" != "" ]; then
      mseReturn+=" "
    fi
    mseTmp=$(printf $((8#${mseByte})))
    mseTmp=$(printf "%X" ${mseTmp})
    mseReturn+="${mseTmp}"
  done

  LC_CTYPE="${oLC_CTYPE}"
  printf "${mseReturn}"
}
MSE_GLOBAL_CMD["str convert octalToHex"]="mse_str_convert_octalToHex"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_convert_octalToHex_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Octal :: r :: charOctal"
}
