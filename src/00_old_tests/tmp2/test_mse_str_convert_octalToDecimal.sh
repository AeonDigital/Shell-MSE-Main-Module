#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convert_octalToDecimal() {
  testResult=$(mse_str_convert_octalToDecimal)
  testExpected="Parameter \"Octal\" is required"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_octalToDecimal "not")
  testExpected="Parameter \"Octal\" is not a valid octal representation of char"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_octalToDecimal "151")
  testExpected="105"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_octalToDecimal "303 255")
  testExpected="195 173"

  mse_utest_assertEqual
}
