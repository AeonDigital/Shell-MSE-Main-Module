#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_check_isInteger() {
  testResult=$(mse_check_isInteger)
  testExpected="Parameter \"Value\" is required"

  mse_utest_assertEqual


  testResult=$(mse_check_isInteger "non integer")
  testExpected="0"

  mse_utest_assertEqual


  testResult=$(mse_check_isInteger "9876543987")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isInteger "-9876543987")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isInteger "9876543.987")
  testExpected="0"

  mse_utest_assertEqual


  testResult=$(mse_check_isInteger "987-6543987")
  testExpected="0"

  mse_utest_assertEqual

}
