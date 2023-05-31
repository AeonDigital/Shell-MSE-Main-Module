#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_decimal_to_hex() {
  testResult=$(mse_str_convert_decimal_to_hex "69")
  testExpected="45"

  mse_md_utest_assertEqual


  testResult=$(mse_str_convert_decimal_to_hex "195 173")
  testExpected="C3 AD"

  mse_md_utest_assertEqual
}
