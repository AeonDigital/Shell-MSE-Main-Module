#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_count_substring() {
  testResult=$(mse_str_count_substring "l" "hello world!!")
  testExpected="3"

  mse_utest_assert_equals


  testResult=$(mse_str_count_substring "o" "hello world!!")
  testExpected="2"

  mse_utest_assert_equals


  testResult=$(mse_str_count_substring "hell" "hello world!!")
  testExpected="1"

  mse_utest_assert_equals


  testResult=$(mse_str_count_substring "well" "hello world!!")
  testExpected="0"

  mse_utest_assert_equals


  testResult=$(mse_str_count_substring "p" "hello world!!")
  testExpected="0"

  mse_utest_assert_equals
}
