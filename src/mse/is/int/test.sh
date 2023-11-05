#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_int() {
  testResult=$(mse_is_int "9876543987")
  testExpected="1"

  mse_utest_assert_equals


  testResult=$(mse_is_int "-9876543987")
  testExpected="1"

  mse_utest_assert_equals


  testResult=$(mse_is_int "9876543.987")
  testExpected="0"

  mse_utest_assert_equals


  testResult=$(mse_is_int "987-6543987")
  testExpected="0"

  mse_utest_assert_equals
}
