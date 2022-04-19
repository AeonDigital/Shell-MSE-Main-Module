#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_check_ifHasValueInArray() {
  testResult=$(mse_check_ifHasValueInArray)
  testExpected="Parameter \"Value\" is required"

  mse_utest_assertEqual


  testResult=$(mse_check_ifHasValueInArray "four")
  testExpected="Parameter \"ArrayName\" is required"

  mse_utest_assertEqual


  testResult=$(mse_check_ifHasValueInArray "four" "testArrayName")
  testExpected="Parameter \"ArrayName\" is not an array name"

  mse_utest_assertEqual

  unset testArray
  declare -a testArray
  testArray=("one" "two" "tree")
  testResult=$(mse_check_ifHasValueInArray "four" "testArray")
  testExpected="0"

  mse_utest_assertEqual


  testResult=$(mse_check_ifHasValueInArray "tree" "testArray")
  testExpected="1"

  mse_utest_assertEqual
}
