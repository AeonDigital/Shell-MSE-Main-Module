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
  #
  # Diretório 'src'
  MSE_TMP_THIS_DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

  #
  # Se o locale para as mensagens não está definido, usa o padrão 'en-us',
  if [ -z ${MSE_GLOBAL_MODULE_LOCALE+x} ]; then
    MSE_GLOBAL_MODULE_LOCALE="en-us"
  fi

  . "${MSE_TMP_THIS_DIRECTORY}/scripts/mse_mmod_registerModule.sh"
  mse_mmod_registerModule "Shell-MSE-Main-Module" "${MSE_TMP_THIS_DIRECTORY}"
  mse_mmod_reorderMetadataIndexes

  unset MSE_TMP_THIS_DIRECTORY
fi
