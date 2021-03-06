#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Elimina qualquer espaços em branco no início ou no final de uma string.
#
# @param string $1
# String que será alterada.
#
# @return
# Printa a string tratada.
mse_str_trim() {
  local str

  str="$1"
  str="${str#"${str%%[![:space:]]*}"}" # trim L
  str="${str%"${str##*[![:space:]]}"}" # trim R

  printf "%s" "${str}"

  #
  # usando 'sed'
  # printf "$1" | sed 's/^\s*//g' | sed 's/\s*$//g'

  #
  # usando 'xargs'
  # Elimina toda ocorrencia de múltiplos espaços entre
  # as palavras portanto não é adequada ao que se deseja.
  # printf "$1" | xargs
}
MSE_GLOBAL_CMD["str trim"]="mse_str_trim"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_trim_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="String :: r :: string"
}
