#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convert_decimalToChar() {
  testResult=$(mse_str_convert_decimalToChar)
  testExpected="Parameter \"Decimal\" is required"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_decimalToChar "not")
  testExpected="Parameter \"Decimal\" is not a valid decimal representation of char"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_decimalToChar "105")
  testExpected="i"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_decimalToChar "195 173")
  testExpected="í"

  mse_utest_assertEqual
}
