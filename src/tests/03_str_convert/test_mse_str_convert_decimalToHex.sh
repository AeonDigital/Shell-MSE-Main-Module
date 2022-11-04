#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convert_decimalToHex() {
  testResult=$(mse_str_convert_decimalToHex "69")
  testExpected="45"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_decimalToHex "195 173")
  testExpected="C3 AD"

  mse_utest_assertEqual
}
