#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_array() {
  unset testArray
  declare -a testArray=()

  testResult=$(mse_is_array "testArray")
  testExpected="1"

  mse_md_utest_assertEqual


  unset testAssocArray
  declare -A testAssocArray

  testResult=$(mse_is_array "testAssocArray")
  testExpected="0"

  mse_md_utest_assertEqual


  unset testVar
  local testVar="test"

  testResult=$(mse_is_array "testVar")
  testExpected="0"

  mse_md_utest_assertEqual
}
