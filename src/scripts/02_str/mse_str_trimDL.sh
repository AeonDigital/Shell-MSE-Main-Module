#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Elimina qualquer espaço em branco existente imediatamente
# ANTES do delimitador indicado.
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
#   result=$(mse_str_trimDL "," "Keep calm   ,   and...")
#   printf $result # "Keep calm,   and..."
mse_str_trimDL() {
  mse_str_trimD "$1" "$2" "l"

  #
  # usando 'sed'
  # sed 's/\s*'"$1"'/'"$1"'/g' <<< "$2"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_trimDL_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=2
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Delimiter :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="String :: r :: string"
}
