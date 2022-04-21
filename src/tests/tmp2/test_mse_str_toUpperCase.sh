#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_toUpperCase() {
  testResult=$(mse_str_toUpperCase)
  testExpected="Parameter \"String\" is required"

  mse_utest_assertEqual


  testResult=$(mse_str_toUpperCase "convert To Upper Case")
  testExpected="CONVERT TO UPPER CASE"

  mse_utest_assertEqual
}
