#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mmod_fileCountLines() {
  testResult="$(mse_mmod_fileCountLines "src/scripts/mmod/file/mse_mmod_fileCountLines.sh")"
  testExpected="49"

  mse_utest_assertEqual
}
