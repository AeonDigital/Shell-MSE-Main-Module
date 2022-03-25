#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mmod_checkIfInteger() {
  testResult=$(mse_mmod_checkIfInteger "non integer")
  testExpected="0"

  mse_utest_assertEqual


  testResult=$(mse_mmod_checkIfInteger "9876543987")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_mmod_checkIfInteger "9876543.987")
  testExpected="0"

  mse_utest_assertEqual
}
