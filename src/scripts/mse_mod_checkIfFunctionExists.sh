#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite identificar se uma função está definida no escopo atual do terminal.
# Printa '1' se sim e '0' se não.
#
# @param string $1
# Nome da função que está sendo verificada.
mse_mod_checkIfFunctionExists() {
  if [ "$(type -t $1)" == "function" ]; then printf "1\n"; else printf "0\n"; fi
}
