#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite identificar se o nome da função passada está definida no escopo
# atual do terminal.
#
# @param string $1
# Valor que será testado.
#
# @return
# '1' se 'true'
# '0' se 'false'
mse_check_isFunctionExists() {
  local mseReturn

  if [ "$(type -t $1)" == "function" ]; then mseReturn=1; else mseReturn=0; fi

  printf "%s" "${mseReturn}"
}
MSE_GLOBAL_CMD["check is functionExists"]="mse_check_isFunctionExists"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_check_isFunctionExists_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Value :: r :: string"
}
