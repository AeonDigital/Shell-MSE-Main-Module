#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mmod_replacePlaceHolder() {
  testResult=$(mse_mmod_replacePlaceHolder)
  testExpected=$(printf "${MSE_GLOBAL_MODULE_ALERT_INDENT}ERROR (in mse_mmod_replacePlaceHolder) : lost argument\n")

  mse_utest_assertEqual



  testResult=$(mse_mmod_replacePlaceHolder "PH" "test" "this is a [[PH]]")
  testExpected=$(printf "this is a test")

  mse_utest_assertEqual
}
