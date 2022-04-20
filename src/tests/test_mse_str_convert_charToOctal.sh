#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convert_charToOctal() {
  testResult=$(mse_str_convert_charToOctal)
  testExpected="Parameter \"Char\" is required"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_charToOctal "not")
  testExpected="Parameter \"Char\" is not a char"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_charToOctal "i")
  testExpected="151"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_charToOctal "í")
  testExpected="303 255"

  mse_utest_assertEqual
}
