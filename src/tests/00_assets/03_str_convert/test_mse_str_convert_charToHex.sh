#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convert_charToHex() {
  testResult=$(mse_str_convert_charToHex "i")
  testExpected="69"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_charToHex "í")
  testExpected="C3 AD"

  mse_utest_assertEqual
}
