#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_pad() {
  testResult=$(mse_str_pad "32" "0" "5" "r")
  testExpected="32000"

  mse_utest_assert_equals


  testResult=$(mse_str_pad "32" "0" "5" "l")
  testExpected="00032"

  mse_utest_assert_equals


  testResult=$(mse_str_pad "32" " " "5" "r")
  testExpected="32   "

  mse_utest_assert_equals


  testResult=$(mse_str_pad "é" " " "5" "l")
  testExpected="    é"

  mse_utest_assert_equals


  testResult=$(mse_str_pad "" "#" "6" "l")
  testExpected="######"

  mse_utest_assert_equals
}
