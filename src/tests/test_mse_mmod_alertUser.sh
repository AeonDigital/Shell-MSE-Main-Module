#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mmod_alertUser() {
  testResult=$(mse_mmod_alertUser)
  testExpected=$(printf "${MSE_GLOBAL_MODULE_ALERT_INDENT}ERROR (in mse_mmod_alertUser) : empty array MSE_GLOBAL_MODULE_ALERT_MSG")
  MSE_GLOBAL_MODULE_ALERT_MSG=()
  MSE_GLOBAL_MODULE_GENERAL_MSG=()


  mse_utest_assertEqual



  MSE_GLOBAL_MODULE_ALERT_MSG[0]="Testando alert"

  testResult=$(mse_mmod_alertUser)
  testExpected=$(printf "${MSE_GLOBAL_MODULE_ALERT_INDENT}Testando alert\n")
  MSE_GLOBAL_MODULE_ALERT_MSG=()
  MSE_GLOBAL_MODULE_GENERAL_MSG=()

  mse_utest_assertEqual
}
