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

  . "${MSE_TMP_THIS_DIRECTORY}/scripts/09_mmod/mse_mmod_registerModule.sh"
  mse_mmod_registerModule "Shell-MSE-Main-Module" "${MSE_TMP_THIS_DIRECTORY}"

  for moduleName in "${!MSE_AVAILABLE_MODULES[@]}"; do
    if [ "${MSE_AVAILABLE_MODULES[${moduleName}]}" == "1" ]; then
      MSE_TMP_THIS_MODULE_DIRECTORY="${MSE_TMP_THIS_DIRECTORY}/../${moduleName}/src"
      mse_mmod_registerModule "${moduleName}" "${MSE_TMP_THIS_MODULE_DIRECTORY}"
    fi
  done
  unset moduleName

  mse_mmod_reorderMetadataIndexes

  unset MSE_TMP_THIS_MODULE_DIRECTORY
  unset MSE_TMP_THIS_DIRECTORY
fi
