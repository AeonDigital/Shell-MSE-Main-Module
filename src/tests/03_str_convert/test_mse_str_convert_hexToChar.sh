#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convert_hexToChar() {
  testResult=$(mse_str_convert_hexToChar "69")
  testExpected="i"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_hexToChar "C3 AD")
  testExpected="í"

  mse_utest_assertEqual
}
