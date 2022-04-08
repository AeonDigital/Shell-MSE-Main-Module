#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convertHexToDecimal() {
  testResult=$(mse_str_convertHexToDecimal "C3 AD")
  testExpected="195 173"

  mse_utest_assertEqual
}
