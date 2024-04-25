#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_pos() {
  testResult=$(mse_str_pos "teste" "w")
  testExpected="-1"

  mse_utest_assert_equals


  testResult=$(mse_str_pos "teste" "t")
  testExpected="0"

  mse_utest_assert_equals


  testResult=$(mse_str_pos "teste" "e")
  testExpected="1"

  mse_utest_assert_equals


  testResult=$(mse_str_pos "teste" "s")
  testExpected="2"

  mse_utest_assert_equals
}
