#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_contains() {
  testResult=$(mse_str_contains "this" "if this contains")
  testExpected="1"

  mse_utest_assert_equals


  testResult=$(mse_str_contains "this" "if not contains")
  testExpected="0"

  mse_utest_assert_equals
}
