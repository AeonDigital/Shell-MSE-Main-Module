#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_check_isCharDecimal() {
  testResult=$(mse_check_isCharDecimal "105")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isCharDecimal "195 173")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isCharDecimal "a")
  testExpected="0"

  mse_utest_assertEqual


  testResult=$(mse_check_isCharDecimal 1)
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isCharDecimal 12b)
  testExpected="0"

  mse_utest_assertEqual
}
