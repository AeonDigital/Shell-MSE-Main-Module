#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_assoc() {
  unset testArray
  declare -a testArray=()

  testResult=$(mse_is_assoc "testArray")
  testExpected="0"

  mse_utest_assert_equals


  unset testAssocArray
  declare -A testAssocArray

  testResult=$(mse_is_assoc "testAssocArray")
  testExpected="1"

  mse_utest_assert_equals


  unset testVar
  local testVar="test"

  testResult=$(mse_is_assoc "testVar")
  testExpected="0"

  mse_utest_assert_equals
}
