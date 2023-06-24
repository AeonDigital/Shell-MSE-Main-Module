#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_array_has_value() {
  unset testArray
  declare -a testArray=()
  testArray=("one" "two" "tree")
  testResult=$(mse_array_has_value "four" "testArray")
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_array_has_value "tree" "testArray")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_array_has_value "TREE" "testArray")
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_array_has_value "TREE" "testArray" "0")
  testExpected="1"

  mse_md_utest_assertEqual
}
