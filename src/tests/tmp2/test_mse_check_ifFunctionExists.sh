#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_check_ifFunctionExists() {
  testResult=$(mse_check_ifFunctionExists)
  testExpected="Parameter \"FunctionName\" is required"

  mse_utest_assertEqual


  testResult=$(mse_check_ifFunctionExists "nonExists")
  testExpected="0"

  mse_utest_assertEqual


  testResult=$(mse_check_ifFunctionExists "mse_mmod_registerModule")
  testExpected="1"

  mse_utest_assertEqual
}
