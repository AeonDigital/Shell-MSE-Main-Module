#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convertCharToOctal() {
  testResult=$(mse_str_convertCharToOctal "í")
  testExpected="303 255"

  mse_utest_assertEqual
}
