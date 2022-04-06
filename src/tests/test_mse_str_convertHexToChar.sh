#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convertHexToChar() {
  testResult=$(mse_str_convertHexToChar "C3 AD")
  testExpected="í"

  mse_utest_assertEqual
}
