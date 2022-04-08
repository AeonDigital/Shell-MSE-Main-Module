#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mmod_checkIfFunctionExists() {
  testResult=$(mse_mmod_checkIfFunctionExists "nonExists")
  testExpected="0"

  mse_utest_assertEqual



  testResult=$(mse_mmod_checkIfFunctionExists "mse_mmod_registerModule")
  testExpected="1"

  mse_utest_assertEqual
}
