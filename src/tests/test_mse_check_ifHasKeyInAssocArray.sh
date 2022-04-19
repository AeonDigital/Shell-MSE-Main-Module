#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_check_ifHasKeyInAssocArray() {
  testResult=$(mse_check_ifHasKeyInAssocArray)
  testExpected="Parameter \"KeyName\" is required"

  mse_utest_assertEqual


  testResult=$(mse_check_ifHasKeyInAssocArray "key2")
  testExpected="Parameter \"AssocArrayName\" is required"

  mse_utest_assertEqual


  testResult=$(mse_check_ifHasKeyInAssocArray "key2" "testAssocArray")
  testExpected="Parameter \"AssocArrayName\" is not an associative array name"

  mse_utest_assertEqual

  unset testAssocArray
  declare -A testAssocArray
  testAssocArray["key1"]="one"
  testResult=$(mse_check_ifHasKeyInAssocArray "key2" "testAssocArray")
  testExpected="0"

  mse_utest_assertEqual


  testResult=$(mse_check_ifHasKeyInAssocArray "key1" "testAssocArray")
  testExpected="1"

  mse_utest_assertEqual
}
