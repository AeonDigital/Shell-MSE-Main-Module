#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_array_get_index_byValue() {
  unset testArray
  declare -a testArray=()
  testArray=("one" "two" "tree")
  testResult=$(mse_array_get_index_byValue "one" "testArray")
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_array_get_index_byValue "two" "testArray")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_array_get_index_byValue "tree" "testArray")
  testExpected="2"

  mse_md_utest_assertEqual


  testResult=$(mse_array_get_index_byValue "TREE" "testArray" "0")
  testExpected="2"

  mse_md_utest_assertEqual


  testResult=$(mse_array_get_index_byValue "four" "testArray")
  testExpected=""

  mse_md_utest_assertEqual
}
