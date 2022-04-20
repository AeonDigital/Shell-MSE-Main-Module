#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_convert_octalToHex() {
  testResult=$(mse_str_convert_octalToHex)
  testExpected="Parameter \"Octal\" is required"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_octalToHex "not")
  testExpected="Parameter \"Octal\" is not a valid octal representation of char"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_octalToHex "151")
  testExpected="69"

  mse_utest_assertEqual


  testResult=$(mse_str_convert_octalToHex "303 255")
  testExpected="C3 AD"

  mse_utest_assertEqual
}
