#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Elimina qualquer espaço em branco no final da string indicada.
#
# @param string $1
# String que será alterada.
#
# @return
# Printa a string tratada.
#
# @example
#   result=$(mse_str_trimR "   texto aqui   ")
#   printf $result # "   texto aqui"
mse_str_trimR() {
  local mseReturn

  mseReturn="$1"
  mseReturn="${mseReturn%"${mseReturn##*[![:space:]]}"}" # trim R

  printf "%s" "${mseReturn}"
}
MSE_GLOBAL_CMD["str trimR"]="mse_str_trimR"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_trimR_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="String :: r :: string"
}
