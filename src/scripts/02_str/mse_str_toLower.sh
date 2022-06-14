#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte o argumento passado para minúsculas.
#
# @param string $1
# String que será convertida
#
# @return
# Printa a string de entrada em lowercase.
#
# @example
#   result=$(mse_str_toLower "TEXT")
mse_str_toLower() {
  printf "%s" "${1,,}"
}
MSE_GLOBAL_CMD["str toLower"]="mse_str_toLower"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_toLower_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="String :: r :: string"
}
