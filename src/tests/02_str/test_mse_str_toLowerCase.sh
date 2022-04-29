#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_toLowerCase() {
  testResult=$(mse_str_toLowerCase "CONVERT To Lower Case")
  testExpected="convert to lower case"

  mse_utest_assertEqual
}
