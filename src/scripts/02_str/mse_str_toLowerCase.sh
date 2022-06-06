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
#   result=$(mse_str_toLowerCase "TEXT")
mse_str_toLowerCase() {
  printf "%s" "${1,,}"
}
MSE_GLOBAL_CMD["str toLowerCase"]="mse_str_toLowerCase"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_toLowerCase_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="String :: r :: string"
}
