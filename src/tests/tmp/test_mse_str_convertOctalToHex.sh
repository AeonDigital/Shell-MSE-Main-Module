#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convertOctalToHex() {
  testResult=$(mse_str_convertOctalToHex "303 255")
  testExpected="C3 AD"

  mse_utest_assertEqual
}
