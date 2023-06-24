#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_file_read() {
  local dir=$(dirname "${BASH_SOURCE}")

  unset mseTestArrRead
  declare -A mseTestArrRead


  mse_prepare_file_read "mseTestArrRead"

  testResult=$(mse_file_read "${dir}/attachments/test/sample/test_mse_file_read_raw" "mseTestArrRead")
  testExpected="$(< "${dir}/attachments/test/expected/test_mse_file_read_raw_0_0")"

  mse_md_utest_assertEqual


  testResult=$(mse_file_read "${dir}/attachments/test/sample/test_mse_file_read_raw" "mseTestArrRead" "1")
  testExpected="$(< "${dir}/attachments/test/expected/test_mse_file_read_raw_1_0")"

  mse_md_utest_assertEqual


  testResult=$(mse_file_read "${dir}/attachments/test/sample/test_mse_file_read_raw" "mseTestArrRead" "0" "1")
  testExpected="$(< "${dir}/attachments/test/expected/test_mse_file_read_raw_1_1")"

  mse_md_utest_assertEqual
}
