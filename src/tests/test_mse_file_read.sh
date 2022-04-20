#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_file_read() {
  testResult=$(mse_file_read)
  testExpected="Parameter \"PathToFile\" is required"

  mse_utest_assertEqual


  testResult=$(mse_file_read "src/tests/samples/test_mse_file_read_raw")
  testExpected="$(< "src/tests/expected/test_mse_file_read_raw_0_0")"

  mse_utest_assertEqual


  testResult=$(mse_file_read "src/tests/samples/test_mse_file_read_raw" "1")
  testExpected="$(< "src/tests/expected/test_mse_file_read_raw_1_0")"

  mse_utest_assertEqual


  testResult=$(mse_file_read "src/tests/samples/test_mse_file_read_raw" "1" "1")
  testExpected="$(< "src/tests/expected/test_mse_file_read_raw_1_1")"

  mse_utest_assertEqual
}
