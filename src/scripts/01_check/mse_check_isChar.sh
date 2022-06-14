#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite identificar se um valor passado é um único character (UTF-8 safe).
#
# @param string $1
# Valor que será testado.
#
# @return
# '1' se 'true'
# '0' se 'false'
mse_check_isChar() {
  local mseReturn
  local oLC_CTYPE

  oLC_CTYPE="$LC_CTYPE"
  LC_CTYPE=""
  if [ "${#1}" == 1 ]; then mseReturn=1; else mseReturn=0; fi
  LC_CTYPE="${oLC_CTYPE}"

  printf "%s" "$mseReturn"
}
MSE_GLOBAL_CMD["is char"]="mse_check_isChar"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_check_isChar_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Value :: r :: char"
}
