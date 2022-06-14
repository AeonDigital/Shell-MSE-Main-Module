#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite identificar se um valor passado é uma representação hexadecimal
# válida de um único caracter (UTF-8 safe).
#
# @param string $1
# Valor que será testado.
#
# @return
# '1' se 'true'
# '0' se 'false'
mse_check_isCharHex() {
  local mseReturn

  local mseI
  local mseREG
  local mseArrParam

  mseREG='^[0-9A-Fa-f]{1,2}$'
  mseArrParam=(${1// / })

  mseReturn=1
  for (( mseI=0; mseI<${#mseArrParam[@]}; mseI++ )); do
    if [ $mseReturn == 1 ]; then
      if ! [[ "${mseArrParam[$mseI]}" =~ $mseREG ]]; then
        mseReturn=0
        break
      fi
    fi
  done

  printf "%s" "${mseReturn}"
}
MSE_GLOBAL_CMD["is charHex"]="mse_check_isCharHex"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_check_isCharHex_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Value :: r :: charHex"
}
