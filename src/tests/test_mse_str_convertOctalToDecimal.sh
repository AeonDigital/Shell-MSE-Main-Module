#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convertOctalToDecimal() {
  testResult=$(mse_str_convertOctalToDecimal "303 255")
  testExpected="195 173"

  mse_utest_assertEqual
}
