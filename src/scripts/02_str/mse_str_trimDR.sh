#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Elimina qualquer espaço em branco existente imediatamente
# APÓS do delimitador indicado.
#
# @param string $1
# Delimitador.
#
# @param string $2
# String que será alterada.
#
# @return
# Printa a string tratada.
#
# @example
#   result=$(mse_str_trimDR "," "Keep calm   ,   and...")
#   printf $result # "Keep calm   ,and..."
mse_str_trimDR() {
  mse_str_trimD "$1" "$2" "r"

  #
  # usando 'sed'
  # sed 's/'"$1"'\s*/'"$1"'/g' <<< "$2"
}
MSE_GLOBAL_CMD["str trimDR"]="mse_str_trimDR"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_trimDR_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=2
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Delimiter :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="String :: r :: string"
}
