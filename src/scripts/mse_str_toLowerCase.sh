#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Converte o argumento passado para minúsculas.
#
# @param string $1
# String que será convertida
#
# @example
#   result=$(mse_str_toLowerCase "TEXT")
mse_str_toLowerCase() {
  printf "${1,,}"
}
