#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# A partir de um comando que executa um programa, identifica
# se o mesmo está disponível para uso.
#
# @param string $1
# Comando que será usado para testar a disponibilidade do programa
# É recomendado o uso de algum comando de baixo impacto como os
# típicos '-v | --version'
#
# @return
# '1' se 'true'
# '0' se 'false'
mse_check_isCommandExists() {
  local mseReturn

  $1 &> /dev/null
  if [ $? == 0 ]; then mseReturn=1; else mseReturn=0; fi

  printf "%s" "${mseReturn}"
}
MSE_GLOBAL_CMD["is commandExists"]="mse_check_isCommandExists"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_check_isCommandExists_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Command :: r :: string"
}
