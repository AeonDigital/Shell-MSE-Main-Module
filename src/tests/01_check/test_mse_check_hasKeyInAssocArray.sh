#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_check_hasKeyInAssocArray() {
  unset testAssocArray
  declare -A testAssocArray
  testAssocArray["key1"]="one"
  testResult=$(mse_check_hasKeyInAssocArray "key2" "testAssocArray")
  testExpected="0"

  mse_utest_assertEqual


  testResult=$(mse_check_hasKeyInAssocArray "key1" "testAssocArray")
  testExpected="1"

  mse_utest_assertEqual
}
