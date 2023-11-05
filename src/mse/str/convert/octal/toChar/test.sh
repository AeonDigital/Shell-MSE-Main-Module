#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_octal_toChar() {
  testResult=$(mse_str_convert_octal_toChar "151")
  testExpected="i"

  mse_utest_assert_equals


  testResult=$(mse_str_convert_octal_toChar "303 255")
  testExpected="í"

  mse_utest_assert_equals
}
