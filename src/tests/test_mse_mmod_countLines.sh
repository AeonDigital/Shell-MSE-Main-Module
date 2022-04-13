#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mmod_countLines() {
  testResult="$(mse_mmod_countLines "src/scripts/mse_mmod_countLines.sh")"
  testExpected="49"

  mse_utest_assertEqual
}
