#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convert_hexToOctal() {
  testResult=$(mse_str_convert_hexToOctal)
  testExpected="Parameter \"Hex\" is required"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_hexToOctal "not")
  testExpected="Parameter \"Hex\" is not a valid hexadecimal representation of char"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_hexToOctal "69")
  testExpected="151"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_hexToOctal "C3 AD")
  testExpected="303 255"

  mse_utest_assertEqual
}
