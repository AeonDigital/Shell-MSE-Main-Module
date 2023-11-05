#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_char_hex() {
  testResult=$(mse_is_char_hex "69")
  testExpected="1"

  mse_utest_assert_equals


  testResult=$(mse_is_char_hex "C3 AD")
  testExpected="1"

  mse_utest_assert_equals


  testResult=$(mse_is_char_hex "aj")
  testExpected="0"

  mse_utest_assert_equals


  testResult=$(mse_is_char_hex 1x)
  testExpected="0"

  mse_utest_assert_equals


  testResult=$(mse_is_char_hex 12b)
  testExpected="0"

  mse_utest_assert_equals
}
