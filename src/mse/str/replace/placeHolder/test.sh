#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_replace_placeHolder() {
  testResult=$(mse_str_replace_placeHolder)
  testExpected=""

  mse_utest_assert_equals


  testResult=$(mse_str_replace_placeHolder "this is a [[PH]]")
  testExpected=""

  mse_utest_assert_equals


  testResult=$(mse_str_replace_placeHolder "this is a [[PH]]" "PH" "test" "wrong")
  testExpected=""

  mse_utest_assert_equals


  testResult=$(mse_str_replace_placeHolder "this is a [[PH]]" "PH" "test")
  testExpected=$(echo -ne "this is a test")

  mse_utest_assert_equals


  testResult=$(mse_str_replace_placeHolder "this is a [[PH]] and another [[APH]]" "PH" "test" "APH" "placeholder")
  testExpected=$(echo -ne "this is a test and another placeholder")

  mse_utest_assert_equals
}