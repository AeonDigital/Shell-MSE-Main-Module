#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convertDecimalToHex() {
  testResult=$(mse_str_convertDecimalToHex "195 173")
  testExpected="C3 AD"

  mse_utest_assertEqual
}
