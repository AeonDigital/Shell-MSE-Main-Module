#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Substitui toda ocorrencia da string $1 pela
# string $2 encontrada na string definida em $3.
#
# @param string $1
# String antiga (que será substituída).
#
# @param string $2
# String nova (que será adicionada no local da antiga).
#
# @param string $3
# String original. Onde ocorrerá a substituição
#
# @example
#   result=$(mse_str_replace "22" "20" "2022-12-22")
#   printf $result # "2020-12-20"
mse_str_replace() {
  local mseStr=""


  if [ $# -lt 3 ]; then
    mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_lostArgument}"
  else
    #
    # Apenas se a string original não estiver vazia...
    if [ "$3" != "" ]; then
      mseStr="${3//$1/$2}"
    fi
  fi

  printf "${mseStr}"
}
