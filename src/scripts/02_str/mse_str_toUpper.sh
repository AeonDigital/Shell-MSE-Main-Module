#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte o argumento passado para maiúsculas.
#
# @param string $1
# String que será convertida.
#
# @return
# Printa a string de entrada em uppercase.
#
# @example
#   result=$(mse_str_toUpper "text")
mse_str_toUpper() {
  printf "%s" "${1^^}"
}
MSE_GLOBAL_CMD["str toUpper"]="mse_str_toUpper"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_toUpper_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="String :: r :: string"
}
