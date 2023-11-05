#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_decimal_toHex() {
  testResult=$(mse_str_convert_decimal_toHex "69")
  testExpected="45"

  mse_utest_assert_equals


  testResult=$(mse_str_convert_decimal_toHex "195 173")
  testExpected="C3 AD"

  mse_utest_assert_equals
}
