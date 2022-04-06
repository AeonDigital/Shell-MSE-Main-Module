#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convertDecimalToChar() {
  testResult=$(mse_str_convertDecimalToChar "195 173")
  testExpected="í"

  mse_utest_assertEqual
}
