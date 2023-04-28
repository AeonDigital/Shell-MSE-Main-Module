#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_array_get_keyByValue() {
  unset testAssocArray
  declare -A testAssocArray
  testAssocArray["one"]="aaa"
  testAssocArray["two"]="bbb"
  testAssocArray["tree"]="ccc"
  testResult=$(mse_array_get_keyByValue "aaa" "testAssocArray")
  testExpected="one"

  mse_md_utest_assertEqual


  testResult=$(mse_array_get_keyByValue "bbb" "testAssocArray")
  testExpected="two"

  mse_md_utest_assertEqual


  testResult=$(mse_array_get_keyByValue "ccc" "testAssocArray")
  testExpected="tree"

  mse_md_utest_assertEqual


  testResult=$(mse_array_get_keyByValue "CCC" "testAssocArray" "1")
  testExpected="tree"

  mse_md_utest_assertEqual


  testResult=$(mse_array_get_keyByValue "DDD" "testAssocArray")
  testExpected=""

  mse_md_utest_assertEqual
}
