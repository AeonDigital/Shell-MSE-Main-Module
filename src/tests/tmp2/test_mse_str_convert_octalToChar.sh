#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convert_octalToChar() {
  testResult=$(mse_str_convert_octalToChar)
  testExpected="Parameter \"Octal\" is required"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_octalToChar "not")
  testExpected="Parameter \"Octal\" is not a valid octal representation of char"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_octalToChar "151")
  testExpected="i"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_octalToChar "303 255")
  testExpected="í"

  mse_utest_assertEqual
}
