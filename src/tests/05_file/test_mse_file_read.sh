#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_file_read() {
  testResult=$(mse_file_read "src/tests/00_assets/samples/file_read/test_mse_file_read_raw")
  testExpected="$(< "src/tests/00_assets/expected/file_read/test_mse_file_read_raw_0_0")"

  mse_utest_assertEqual


  testResult=$(mse_file_read "src/tests/00_assets/samples/file_read/test_mse_file_read_raw" "1")
  testExpected="$(< "src/tests/00_assets/expected/file_read/test_mse_file_read_raw_1_0")"

  mse_utest_assertEqual


  testResult=$(mse_file_read "src/tests/00_assets/samples/file_read/test_mse_file_read_raw" "1" "1")
  testExpected="$(< "src/tests/00_assets/expected/file_read/test_mse_file_read_raw_1_1")"

  mse_utest_assertEqual
}
