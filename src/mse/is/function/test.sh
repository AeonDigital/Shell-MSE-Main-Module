#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_function() {
  testResult=$(mse_is_function "nonExists")
  testExpected="0"

  mse_utest_assert_equals


  testResult=$(mse_is_function "test_mse_is_function")
  testExpected="1"

  mse_utest_assert_equals
}
