#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convert_charToDecimal() {
  testResult=$(mse_str_convert_charToDecimal)
  testExpected="Parameter \"Char\" is required"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_charToDecimal "not")
  testExpected="Parameter \"Char\" is not a char"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_charToDecimal "i")
  testExpected="105"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_charToDecimal "í")
  testExpected="195 173"

  mse_utest_assertEqual
}
