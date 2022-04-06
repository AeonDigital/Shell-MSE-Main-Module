#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convertCharToHex() {
  testResult=$(mse_str_convertCharToHex "í")
  testExpected="C3 AD"

  mse_utest_assertEqual
}
