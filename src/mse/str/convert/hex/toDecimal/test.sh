#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_hex_toDecimal() {
  testResult=$(mse_str_convert_hex_toDecimal "69")
  testExpected="105"

  mse_utest_assert_equals


  testResult=$(mse_str_convert_hex_toDecimal "C3 AD")
  testExpected="195 173"

  mse_utest_assert_equals
}
