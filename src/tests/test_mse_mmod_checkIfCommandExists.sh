#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mmod_checkIfCommandExists() {
  testResult=$(mse_mmod_checkIfCommandExists 'ls --version')
  testExpected="1"

  mse_utest_assertEqual



  testResult=$(mse_mmod_checkIfCommandExists 'nonexists --version')
  testExpected="0"

  mse_utest_assertEqual
}
