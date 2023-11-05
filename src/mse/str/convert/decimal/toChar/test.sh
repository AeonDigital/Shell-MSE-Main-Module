#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_decimal_toChar() {
  testResult=$(mse_str_convert_decimal_toChar "105")
  testExpected="i"

  mse_utest_assert_equals


  testResult=$(mse_str_convert_decimal_toChar "195 173")
  testExpected="í"

  mse_utest_assert_equals
}
