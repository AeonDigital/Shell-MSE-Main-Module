#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Elimina qualquer espaços em branco no início ou no final de uma string.
#
# @param string $1
# String que será alterada.
#
# @example
#   result=$(mse_str_trim "   texto  aqui   ")
#   printf $result # "texto  aqui"
mse_str_trim() {
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=1
  mseParamRules["param_0"]="String :: r :: string"

  mseReturn=$(mse_mmod_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    mseReturn="$1"

    mseReturn="${mseReturn#"${mseReturn%%[![:space:]]*}"}" # trim L
    mseReturn="${mseReturn%"${mseReturn##*[![:space:]]}"}" # trim R

    printf "%s" "${mseReturn}"
    return 0
  fi


  #
  # usando 'sed'
  # printf "$1" | sed 's/^\s*//g' | sed 's/\s*$//g'

  #
  # usando 'xargs'
  # Elimina toda ocorrencia de múltiplos espaços entre
  # as palavras portanto não é adequada ao que se deseja.
  # printf "$1" | xargs
}
