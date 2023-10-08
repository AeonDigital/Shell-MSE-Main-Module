#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_file() {
  local dir=$(dirname "${BASH_SOURCE}")

  testResult=$(mse_is_file "${dir}/nonexist.sh")
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_is_file "${dir}/test.sh")
  testExpected="1"

  mse_md_utest_assertEqual
}
