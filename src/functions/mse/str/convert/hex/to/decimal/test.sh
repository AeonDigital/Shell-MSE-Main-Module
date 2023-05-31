#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_hex_to_decimal() {
  testResult=$(mse_str_convert_hex_to_decimal "69")
  testExpected="105"

  mse_md_utest_assertEqual


  testResult=$(mse_str_convert_hex_to_decimal "C3 AD")
  testExpected="195 173"

  mse_md_utest_assertEqual
}
