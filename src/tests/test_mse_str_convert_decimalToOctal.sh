#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convert_decimalToOctal() {
  testResult=$(mse_str_convert_decimalToOctal)
  testExpected="Parameter \"Decimal\" is required"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_decimalToOctal "not")
  testExpected="Parameter \"Decimal\" is not a valid decimal representation of char"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_decimalToOctal "69")
  testExpected="105"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_decimalToOctal "195 173")
  testExpected="303 255"

  mse_utest_assertEqual
}
