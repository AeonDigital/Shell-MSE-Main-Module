#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mmod_setIMessage() {
  testResult=$(mse_mmod_setIMessage)
  testExpected=$(printf "${MSE_GLOBAL_MODULE_ALERT_INDENT}ERROR (in mse_mmod_setIMessage) : lost argument\n")

  mse_utest_assertEqual


  mse_mmod_setIMessage "Teste" "1"
  testResult=${#MSE_GLOBAL_MODULE_GENERAL_MSG[@]}
  testExpected=1

  mse_utest_assertEqual


  mse_mmod_setIMessage "Nova linha"
  testResult=${#MSE_GLOBAL_MODULE_GENERAL_MSG[@]}
  testExpected=2

  mse_utest_assertEqual


  testResult=${MSE_GLOBAL_MODULE_GENERAL_MSG[0]}
  testExpected="Teste"

  mse_utest_assertEqual


  testResult=${MSE_GLOBAL_MODULE_GENERAL_MSG[1]}
  testExpected="Nova linha"

  mse_utest_assertEqual
}
