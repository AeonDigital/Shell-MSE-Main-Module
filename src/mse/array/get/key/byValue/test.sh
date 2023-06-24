#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_array_get_key_byValue() {
  unset testAssocArray
  declare -A testAssocArray
  testAssocArray["one"]="aaa"
  testAssocArray["two"]="bbb"
  testAssocArray["tree"]="ccc"
  testResult=$(mse_array_get_key_byValue "aaa" "testAssocArray")
  testExpected="one"

  mse_md_utest_assertEqual


  testResult=$(mse_array_get_key_byValue "bbb" "testAssocArray")
  testExpected="two"

  mse_md_utest_assertEqual


  testResult=$(mse_array_get_key_byValue "ccc" "testAssocArray")
  testExpected="tree"

  mse_md_utest_assertEqual


  testResult=$(mse_array_get_key_byValue "CCC" "testAssocArray" "0")
  testExpected="tree"

  mse_md_utest_assertEqual


  testResult=$(mse_array_get_key_byValue "DDD" "testAssocArray")
  testExpected=""

  mse_md_utest_assertEqual
}
