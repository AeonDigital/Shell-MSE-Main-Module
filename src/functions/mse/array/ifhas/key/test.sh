#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_array_ifhas_key() {
  unset testAssocArray
  declare -A testAssocArray
  testAssocArray["key1"]="one"
  testAssocArray["key2"]="two"


  testResult=$(mse_array_ifhas_key "key3" "testAssocArray")
  testExpected="0"
  mse_md_utest_assertEqual


  testResult=$(mse_array_ifhas_key "key4" "testAssocArray")
  testExpected="0"
  mse_md_utest_assertEqual


  testResult=$(mse_array_ifhas_key "key1" "testAssocArray")
  testExpected="1"
  mse_md_utest_assertEqual


  testResult=$(mse_array_ifhas_key "key2" "testAssocArray")
  testExpected="1"
  mse_md_utest_assertEqual
}
