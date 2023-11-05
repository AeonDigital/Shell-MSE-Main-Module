#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_octal_toHex() {
  testResult=$(mse_str_convert_octal_toHex "151")
  testExpected="69"

  mse_utest_assert_equals


  testResult=$(mse_str_convert_octal_toHex "303 255")
  testExpected="C3 AD"

  mse_utest_assert_equals
}
