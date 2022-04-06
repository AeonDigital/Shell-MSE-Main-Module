#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convertOctalToChar() {
  testResult=$(mse_str_convertOctalToChar "303 255")
  testExpected="í"

  mse_utest_assertEqual
}
