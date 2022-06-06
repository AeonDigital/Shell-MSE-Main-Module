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
#   result=$(mse_str_toUpperCase "text")
mse_str_toUpperCase() {
  printf "%s" "${1^^}"
}
MSE_GLOBAL_CMD["str toUpperCase"]="mse_str_toUpperCase"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_toUpperCase_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="String :: r :: string"
}
