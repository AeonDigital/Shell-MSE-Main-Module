#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_char_to_decimal() {
  testResult=$(mse_str_convert_char_to_decimal "i")
  testExpected="105"

  mse_md_utest_assertEqual


  testResult=$(mse_str_convert_char_to_decimal "í")
  testExpected="195 173"

  mse_md_utest_assertEqual
}
