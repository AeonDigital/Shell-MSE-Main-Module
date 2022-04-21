#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_check_isFunctionExists() {
  testResult=$(mse_check_isFunctionExists)
  testExpected="Parameter \"FunctionName\" is required"

  mse_utest_assertEqual


  testResult=$(mse_check_isFunctionExists "nonExists")
  testExpected="0"

  mse_utest_assertEqual


  testResult=$(mse_check_isFunctionExists "mse_mmod_registerModule")
  testExpected="1"

  mse_utest_assertEqual
}
