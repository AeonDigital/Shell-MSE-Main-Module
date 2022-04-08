#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convertHexToOctal() {
  testResult=$(mse_str_convertHexToOctal "C3 AD")
  testExpected="303 255"

  mse_utest_assertEqual
}
