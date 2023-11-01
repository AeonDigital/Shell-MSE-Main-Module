#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_dir() {
  local dir=$(echo "${BASH_SOURCE%/*}")

  testResult=$(mse_is_dir "${dir}/nonexist")
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_is_dir "${dir}/attachments")
  testExpected="1"

  mse_md_utest_assertEqual
}
