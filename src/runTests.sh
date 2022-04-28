#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







MSE_TMP_TEST_MODULE_DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd );

#
# para os testes sempre usa o locale 'en-us'
MSE_TMP_GLOBAL_LOCALE=""
if [ -z ${MSE_GLOBAL_MODULE_LOCALE+x} ]; then
  MSE_GLOBAL_MODULE_LOCALE="en-us"
fi
MSE_TMP_GLOBAL_LOCALE=${MSE_GLOBAL_MODULE_LOCALE}
MSE_TMP_PATH_TO_LOCALE="${MSE_TMP_TEST_MODULE_DIRECTORY}/locale/en-us.sh"


#
# Verifica se o módulo principal está presente pela existencia do arquivo
# do locale 'en-us'.
if [ ! -f "${MSE_TMP_PATH_TO_LOCALE}" ]; then
  printf "\n"
  printf "    Attention\n"
  printf "    The module \"Shell-MSE-Main-Module\" was not loaded.\n"
  printf "    Use the following commands to load it:\n"
  printf "    - git submodule update --remote \n"
  printf "\n"
else
  . "${MSE_TMP_PATH_TO_LOCALE}"


  #
  # Caso o módulo de testes não esteja presente...
  if [ ! -d "Shell-MSE-UnitTest/src" ]; then
    local lbl_generic_UnitTestNotFound
    lbl_generic_UnitTestNotFound+="\n"
    lbl_generic_UnitTestNotFound+="    Attention\n"
    lbl_generic_UnitTestNotFound+="    Could not run tests because module \"Shell-MSE-UnitTest\" was not found.\n"
    lbl_generic_UnitTestNotFound+="    Use the following commands to add and configure it:\n"
    lbl_generic_UnitTestNotFound+="    - git submodule add https://github.com/AeonDigital/Shell-MSE-UnitTest.git \n"
    lbl_generic_UnitTestNotFound+="    - git submodule set-branch --branch main -- ./Shell-MSE-UnitTest \n"
    lbl_generic_UnitTestNotFound+="    - git submodule update --remote \n"
    lbl_generic_UnitTestNotFound+="\n"
    lbl_generic_UnitTestNotFound+="    If the module \"Shell-MSE-UnitTest\" is already part of the current repository you can\n"
    lbl_generic_UnitTestNotFound+="    start it using the following commands:\n"
    lbl_generic_UnitTestNotFound+="    - git submodule init \n"
    lbl_generic_UnitTestNotFound+="    - git submodule update --remote \n"
    lbl_generic_UnitTestNotFound+="\n"

    printf "${lbl_generic_UnitTestNotFound}"
  else
    MSE_TMP_TEST_MODULE_DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd );
    . "${MSE_TMP_TEST_MODULE_DIRECTORY}/init.sh"
    . "${MSE_TMP_TEST_MODULE_DIRECTORY}/../Shell-MSE-UnitTest/src/init.sh"

    mse_utest_setTargetDir "$PWD/src"
    mse_utest_execute
  fi
fi


MSE_GLOBAL_MODULE_LOCALE=${MSE_TMP_GLOBAL_LOCALE}
unset MSE_TMP_GLOBAL_LOCALE
unset MSE_TMP_PATH_TO_LOCALE
unset MSE_TMP_TEST_MODULE_DIRECTORY
