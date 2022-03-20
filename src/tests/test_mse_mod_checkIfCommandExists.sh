#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mod_checkIfCommandExists() {
  testResult=$(mse_mod_checkIfCommandExists 'ls --version')
  testExpected="1"

  mse_utest_assertEqual



  testResult=$(mse_mod_checkIfCommandExists 'nonexists --version')
  testExpected="0"

  mse_utest_assertEqual
}
