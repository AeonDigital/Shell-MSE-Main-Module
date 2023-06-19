#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_file_countLines() {
  testResult=$(mse_file_countLines "src/functions/mse/file/countLines/src.sh")
  testExpected="28"

  mse_md_utest_assertEqual
}
