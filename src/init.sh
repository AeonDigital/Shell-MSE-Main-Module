#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]
#
# No diretório raiz use o comando abaixo para carregar o módulo
# . src/init.sh
#
# No diretório raiz use o comando abaixo para executar os testes
# ./src/runTests.sh






#
# Apenas se este módulo ainda não foi carregado
if [ "$(type -t "mse_mmod_registerModule")" != "function" ]; then
  MSE_TMP_THIS_DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
  . "${MSE_TMP_THIS_DIRECTORY}/loadModule.sh"
fi
