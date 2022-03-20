#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mod_checkIfHasValueInArray() {
  local mseTmpTestArray=("one" "two" "tree")
  testResult=$(mse_mod_checkIfHasValueInArray "not in array" "mseTmpTestArray")
  testExpected="0"

  mse_utest_assertEqual



  testResult=$(mse_mod_checkIfHasValueInArray "two" "mseTmpTestArray")
  testExpected="1"

  mse_utest_assertEqual
}
