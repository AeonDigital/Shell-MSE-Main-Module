#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]
#
# No diretório raiz use o comando abaixo para carregar o módulo
# . src/init.sh
#
# No diretório raiz use o comando abaixo para executar os testes
# ./src/runTests.sh






#
# Apenas se este módulo ainda não foi carregado
if [[ $(type -t "mse_mod_registerModule") != function ]]; then
  #
  # Diretório 'src'
  MSE_TMP_THIS_DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


  #
  # Carrega as variáveis do módulo caso um arquivo 'variables.sh' esteja definido
  if [ -f "${MSE_TMP_THIS_DIRECTORY}/config/variables.sh" ]; then
    source "${MSE_TMP_THIS_DIRECTORY}/config/variables.sh"
  fi

  #
  # Carrega os 'aliases' do módulo caso um arquivo 'aliases.sh' esteja definido
  if [ -f "${MSE_TMP_THIS_DIRECTORY}/config/aliases.sh" ]; then
    source "${MSE_TMP_THIS_DIRECTORY}/config/aliases.sh"
  fi


  source "${MSE_TMP_THIS_DIRECTORY}/scripts/mse_mod_registerModule.sh"
  mse_mod_registerModule "#MainModule" "${MSE_TMP_THIS_DIRECTORY}"


  unset MSE_TMP_THIS_DIRECTORY
fi
