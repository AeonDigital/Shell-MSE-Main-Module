#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_array_has_index() {
  unset testArray
  declare -a testArray
  testArray+=("one")
  testArray+=("two")


  testResult=$(mse_array_has_index "2" "testArray")
  testExpected="0"
  mse_utest_assert_equals


  testResult=$(mse_array_has_index "3" "testArray")
  testExpected="0"
  mse_utest_assert_equals


  testResult=$(mse_array_has_index "0" "testArray")
  testExpected="1"
  mse_utest_assert_equals


  testResult=$(mse_array_has_index "1" "testArray")
  testExpected="1"
  mse_utest_assert_equals
}
