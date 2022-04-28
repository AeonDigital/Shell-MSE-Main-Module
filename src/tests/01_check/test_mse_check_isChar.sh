#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_check_isChar() {
  testResult=$(mse_check_isChar "a")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isChar "ab")
  testExpected="0"

  mse_utest_assertEqual


  testResult=$(mse_check_isChar "1")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isChar 1)
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isChar 12)
  testExpected="0"

  mse_utest_assertEqual
}
