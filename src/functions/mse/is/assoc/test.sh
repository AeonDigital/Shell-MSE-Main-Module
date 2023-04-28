#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_assoc() {
  unset testArray
  declare -a testArray=()

  testResult=$(mse_is_assoc "testArray")
  testExpected="0"

  mse_md_utest_assertEqual


  unset testAssocArray
  declare -A testAssocArray

  testResult=$(mse_is_assoc "testAssocArray")
  testExpected="1"

  mse_md_utest_assertEqual


  unset testVar
  local testVar="test"

  testResult=$(mse_is_assoc "testVar")
  testExpected="0"

  mse_md_utest_assertEqual
}
