#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mod_errorAlert() {
  testResult=$(mse_mod_errorAlert)
  testExpected=$(printf "        ERROR (in mse_mod_errorAlert) : lost argument")

  mse_utest_assertEqual



  testResult=$(mse_mod_errorAlert "fnName" "expected 2 arguments")
  testExpected=$(printf "        ERROR (in fnName) : expected 2 arguments")

  mse_utest_assertEqual
}
