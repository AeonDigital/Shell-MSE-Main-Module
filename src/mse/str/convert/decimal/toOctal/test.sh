#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_decimal_toOctal() {
  testResult=$(mse_str_convert_decimal_toOctal "69")
  testExpected="105"

  mse_md_utest_assertEqual


  testResult=$(mse_str_convert_decimal_toOctal "195 173")
  testExpected="303 255"

  mse_md_utest_assertEqual
}
