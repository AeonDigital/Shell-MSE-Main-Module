#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_check_isCharOctal() {
  testResult=$(mse_check_isCharOctal "151")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isCharOctal "303 255")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isCharOctal 151)
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isCharOctal 012)
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isCharOctal 2)
  testExpected="0"

  mse_utest_assertEqual


  testResult=$(mse_check_isCharOctal 1512)
  testExpected="0"

  mse_utest_assertEqual
}
