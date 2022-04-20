#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_file_countLines() {
  testResult=$(mse_file_countLines)
  testExpected="Parameter \"PathToFile\" is required"

  mse_utest_assertEqual


  testResult="$(mse_file_countLines "src/scripts/file/mse_file_countLines.sh")"
  testExpected="61"

  mse_utest_assertEqual
}
