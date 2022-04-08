#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convertDecimalToOctal() {
  testResult=$(mse_str_convertDecimalToOctal "195 173")
  testExpected="303 255"

  mse_utest_assertEqual
}
