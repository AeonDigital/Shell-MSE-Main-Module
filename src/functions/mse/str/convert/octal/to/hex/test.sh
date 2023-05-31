#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_octal_to_hex() {
  testResult=$(mse_str_convert_octal_to_hex "151")
  testExpected="69"

  mse_md_utest_assertEqual


  testResult=$(mse_str_convert_octal_to_hex "303 255")
  testExpected="C3 AD"

  mse_md_utest_assertEqual
}
