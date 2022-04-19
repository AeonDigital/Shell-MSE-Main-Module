#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_check_ifInteger() {
  testResult=$(mse_check_ifInteger)
  testExpected="Parameter \"Value\" is required"

  mse_utest_assertEqual


  testResult=$(mse_check_ifInteger "non integer")
  testExpected="0"

  mse_utest_assertEqual


  testResult=$(mse_check_ifInteger "9876543987")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_ifInteger "-9876543987")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_ifInteger "9876543.987")
  testExpected="0"

  mse_utest_assertEqual


  testResult=$(mse_check_ifInteger "987-6543987")
  testExpected="0"

  mse_utest_assertEqual

}
