#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_file_countLines() {
  testResult="$(mse_file_countLines "src/scripts/05_file/mse_file_countLines.sh")"
  testExpected="55"

  mse_utest_assertEqual
}
