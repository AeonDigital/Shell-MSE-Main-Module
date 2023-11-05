#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_file() {
  local dir=$(echo "${BASH_SOURCE%/*}")

  testResult=$(mse_is_file "${dir}/nonexist.sh")
  testExpected="0"

  mse_utest_assert_equals


  testResult=$(mse_is_file "${dir}/test.sh")
  testExpected="1"

  mse_utest_assert_equals
}
