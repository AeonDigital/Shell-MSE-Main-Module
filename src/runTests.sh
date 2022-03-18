#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Caso o módulo de testes não esteja presente...
MSE_TMP_TEST_MODULE_DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd );

#
# para os testes sempre usa o locale 'en-us'
MSE_TMP_GLOBAL_LOCALE=""
if [ -z ${MSE_GLOBAL_MODULE_LOCALE+x} ]; then
  MSE_GLOBAL_MODULE_LOCALE="en-us"
fi
MSE_TMP_GLOBAL_LOCALE=${MSE_GLOBAL_MODULE_LOCALE}
MSE_TMP_PATH_TO_LOCALE="${MSE_TMP_TEST_MODULE_DIRECTORY}/locale/en-us.sh"
source "${MSE_TMP_PATH_TO_LOCALE}"


if [ ! -d "Shell-MSE-UnitTest/src" ]; then
  printf "${lbl_runTests_UnitTestNotFound}"
else
  source "${MSE_TMP_TEST_MODULE_DIRECTORY}/init.sh"
  source "${MSE_TMP_TEST_MODULE_DIRECTORY}/../Shell-MSE-UnitTest/src/init.sh"

  mse_utest_setTargetDir "$PWD/src"
  mse_utest_execute
fi

MSE_GLOBAL_MODULE_LOCALE=${MSE_TMP_GLOBAL_LOCALE}

unset MSE_TMP_GLOBAL_LOCALE
unset MSE_TMP_PATH_TO_LOCALE
unset MSE_TMP_TEST_MODULE_DIRECTORY
