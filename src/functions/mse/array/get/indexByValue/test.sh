#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_array_get_indexByValue() {
  unset testArray
  declare -a testArray=()
  testArray=("one" "two" "tree")
  testResult=$(mse_array_get_indexByValue "one" "testArray")
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_array_get_indexByValue "two" "testArray")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_array_get_indexByValue "tree" "testArray")
  testExpected="2"

  mse_md_utest_assertEqual


  testResult=$(mse_array_get_indexByValue "TREE" "testArray" "1")
  testExpected="2"

  mse_md_utest_assertEqual


  testResult=$(mse_array_get_indexByValue "four" "testArray")
  testExpected=""

  mse_md_utest_assertEqual
}
