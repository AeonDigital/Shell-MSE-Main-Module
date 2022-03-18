#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mod_errorAlert() {
  testResult=$(mse_mod_errorAlert)
  testExpected=$(echo -e "        ERROR (in mse_mod_errorAlert) : lost arguments")

  mse_utest_assertEqual



  testResult=$(mse_mod_errorAlert "fnName" "expected 2 arguments")
  testExpected=$(echo -e "        ERROR (in fnName) : expected 2 arguments")

  mse_utest_assertEqual
}
