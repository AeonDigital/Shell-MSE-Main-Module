#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Caso o módulo de testes não esteja presente...
if [ ! -d "Shell-MSE-UnitTest/src" ]; then
  printf "\n"
  printf "    Atenção\n"
  printf "    Não foi possível rodar os testes pois o módulo \"Shell-MSE-UnitTest\" não foi encontrado.\n"
  printf "    Use os seguintes comandos para adicioná-lo e configurá-lo:\n"
  printf "    - git submodule add https://github.com/AeonDigital/Shell-MSE-UnitTest.git \n"
  printf "    - git submodule set-branch --branch main -- ./Shell-MSE-UnitTest \n"
  printf "    - git submodule update --remote \n"
  printf "\n"
  printf "    Se o módulo \"Shell-MSE-UnitTest\" já faz parte do repositório atual você pode\n"
  printf "    iniciá-lo usando os comandos a seguir:\n"
  printf "    - git submodule init \n"
  printf "    - git submodule update --remote \n"
  printf "\n"
else
  MSE_TMP_TEST_MODULE_DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd );
  source "${MSE_TMP_TEST_MODULE_DIRECTORY}/init.sh"
  source "${MSE_TMP_TEST_MODULE_DIRECTORY}/../Shell-MSE-UnitTest/src/init.sh"

  mse_utest_setTargetDir "$PWD/src"
  mse_utest_execute
fi
