#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mod_checkIfFunctionExists() {
  testResult=$(mse_mod_checkIfFunctionExists "nonExists")
  testExpected="0"

  mse_utest_assertEqual



  testResult=$(mse_mod_checkIfFunctionExists "mse_mod_registerModule")
  testExpected="1"

  mse_utest_assertEqual
}
