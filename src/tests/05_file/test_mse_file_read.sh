#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_file_read() {
  unset mseTestArrRead
  declare -A mseTestArrRead
  mse_file_prepareRead "mseTestArrRead"

  testResult=$(mse_file_read "src/tests/00_assets/samples/file_read/test_mse_file_read_raw" "mseTestArrRead")
  testExpected="$(< "src/tests/00_assets/expected/file_read/test_mse_file_read_raw_0_0")"

  mse_utest_assertEqual


  testResult=$(mse_file_read "src/tests/00_assets/samples/file_read/test_mse_file_read_raw" "mseTestArrRead" "1")
  testExpected="$(< "src/tests/00_assets/expected/file_read/test_mse_file_read_raw_1_0")"

  mse_utest_assertEqual


  testResult=$(mse_file_read "src/tests/00_assets/samples/file_read/test_mse_file_read_raw" "mseTestArrRead" "0" "1")
  testExpected="$(< "src/tests/00_assets/expected/file_read/test_mse_file_read_raw_1_1")"

  mse_utest_assertEqual
}
