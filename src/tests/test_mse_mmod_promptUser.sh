#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mmod_promptUser() {
  MSE_GLOBAL_MODULE_PROMPT_MSG[0]=$(printf "Você deseja prosseguir?")

  testResult=$(printf "y" | mse_mmod_promptUser)
  testExpected=$(printf "${MSE_GLOBAL_MODULE_PROMPT_INDENT}Você deseja prosseguir?")

  mse_utest_assertEqual



  testResult=$(MSE_GLOBAL_MODULE_PROMPT_TEST=1 && printf "y" | mse_mmod_promptUser)
  testExpected=1

  mse_utest_assertEqual



  testResult=$(MSE_GLOBAL_MODULE_PROMPT_TEST=1 && printf "n" | mse_mmod_promptUser)
  testExpected=0

  mse_utest_assertEqual



  MSE_GLOBAL_MODULE_PROMPT_LIST_OPTIONS_LABELS=("arch" "ubuntu" "debian")
  MSE_GLOBAL_MODULE_PROMPT_LIST_OPTIONS_VALUES=("Arch" "Ubuntu" "Debian")

  testResult=$(MSE_GLOBAL_MODULE_PROMPT_TEST=1 && printf "arch" | mse_mmod_promptUser "list")
  testExpected="Arch"

  mse_utest_assertEqual



  testResult=$(MSE_GLOBAL_MODULE_PROMPT_TEST=1 && printf "my own value" | mse_mmod_promptUser "value")
  testExpected="my own value"

  mse_utest_assertEqual
}
