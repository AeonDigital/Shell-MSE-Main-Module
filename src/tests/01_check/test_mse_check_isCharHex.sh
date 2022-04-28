#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_check_isCharHex() {
  testResult=$(mse_check_isCharHex "69")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isCharHex "C3 AD")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isCharHex "aj")
  testExpected="0"

  mse_utest_assertEqual


  testResult=$(mse_check_isCharHex 1x)
  testExpected="0"

  mse_utest_assertEqual


  testResult=$(mse_check_isCharHex 12b)
  testExpected="0"

  mse_utest_assertEqual
}
