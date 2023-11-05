#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_char() {
  testResult=$(mse_is_char "a")
  testExpected="1"

  mse_utest_assert_equals


  testResult=$(mse_is_char "á")
  testExpected="1"

  mse_utest_assert_equals


  testResult=$(mse_is_char "ab")
  testExpected="0"

  mse_utest_assert_equals


  testResult=$(mse_is_char "1")
  testExpected="1"

  mse_utest_assert_equals


  testResult=$(mse_is_char 1)
  testExpected="1"

  mse_utest_assert_equals


  testResult=$(mse_is_char 12)
  testExpected="0"

  mse_utest_assert_equals
}
