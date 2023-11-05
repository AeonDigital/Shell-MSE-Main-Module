#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_hex_toChar() {
  testResult=$(mse_str_convert_hex_toChar "69")
  testExpected="i"

  mse_utest_assert_equals


  testResult=$(mse_str_convert_hex_toChar "C3 AD")
  testExpected="í"

  mse_utest_assert_equals
}
