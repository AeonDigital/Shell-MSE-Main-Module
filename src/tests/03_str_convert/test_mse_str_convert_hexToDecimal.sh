#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convert_hexToDecimal() {
  testResult=$(mse_str_convert_hexToDecimal "69")
  testExpected="105"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_hexToDecimal "C3 AD")
  testExpected="195 173"

  mse_utest_assertEqual
}
