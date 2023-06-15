#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_octal_toDecimal() {
  testResult=$(mse_str_convert_octal_toDecimal "151")
  testExpected="105"

  mse_md_utest_assertEqual


  testResult=$(mse_str_convert_octal_toDecimal "303 255")
  testExpected="195 173"

  mse_md_utest_assertEqual
}
