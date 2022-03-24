#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mmod_errorAlert() {
  testResult=$(mse_mmod_errorAlert)
  testExpected=$(printf "${MSE_GLOBAL_MODULE_ALERT_INDENT}ERROR (in mse_mmod_errorAlert) : lost argument\n")

  mse_utest_assertEqual



  testResult=$(mse_mmod_errorAlert "fnName" "expected 2 arguments")
  testExpected=$(printf "${MSE_GLOBAL_MODULE_ALERT_INDENT}ERROR (in fnName) : expected 2 arguments\n")

  mse_utest_assertEqual
}
