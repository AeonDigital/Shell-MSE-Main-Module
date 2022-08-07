#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_toUpper() {
  testResult=$(mse_str_toUpper "convert To Upper Case")
  testExpected="CONVERT TO UPPER CASE"

  mse_utest_assertEqual
}
