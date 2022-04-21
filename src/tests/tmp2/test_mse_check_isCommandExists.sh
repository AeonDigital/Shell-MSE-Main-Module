#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_check_isCommandExists() {
  testResult=$(mse_check_isCommandExists)
  testExpected="Parameter \"Command\" is required"

  mse_utest_assertEqual


  testResult=$(mse_check_isCommandExists 'ls --version')
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isCommandExists 'nonexists --version')
  testExpected="0"

  mse_utest_assertEqual
}
