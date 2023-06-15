#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_char_toOctal() {
  testResult=$(mse_str_convert_char_toOctal "i")
  testExpected="151"

  mse_md_utest_assertEqual


  testResult=$(mse_str_convert_char_toOctal "í")
  testExpected="303 255"

  mse_md_utest_assertEqual
}