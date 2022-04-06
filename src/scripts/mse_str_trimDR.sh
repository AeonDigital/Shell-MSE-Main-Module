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
# @example
#   result=$(mse_str_trimDR "," "Keep calm   ,   and...")
#   printf $result # "Keep calm   ,and..."
mse_str_trimDR() {
  mse_str_trimD "$1" "$2" "r"

  #
  # usando 'sed'
  # sed 's/'"$1"'\s*/'"$1"'/g' <<< "$2"
}
