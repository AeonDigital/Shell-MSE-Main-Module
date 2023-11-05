#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_array_has_key() {
  unset testAssocArray
  declare -A testAssocArray
  testAssocArray["key1"]="one"
  testAssocArray["key2"]="two"


  testResult=$(mse_array_has_key "key3" "testAssocArray")
  testExpected="0"
  mse_utest_assert_equals


  testResult=$(mse_array_has_key "key4" "testAssocArray")
  testExpected="0"
  mse_utest_assert_equals


  testResult=$(mse_array_has_key "key1" "testAssocArray")
  testExpected="1"
  mse_utest_assert_equals


  testResult=$(mse_array_has_key "key2" "testAssocArray")
  testExpected="1"
  mse_utest_assert_equals
}
