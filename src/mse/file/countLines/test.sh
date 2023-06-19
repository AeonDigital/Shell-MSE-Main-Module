#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_file_countLines() {
  local dir=$(dirname "${BASH_SOURCE}")

  testResult=$(mse_file_countLines "${dir}/src.sh")
  testExpected="28"

  mse_md_utest_assertEqual
}
