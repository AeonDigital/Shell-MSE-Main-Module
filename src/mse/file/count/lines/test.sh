#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_file_count_lines() {
  local dir=$(echo "${BASH_SOURCE%/*}")

  testResult=$(mse_file_count_lines "${dir}/src.sh")
  testExpected="24"

  mse_utest_assert_equals
}
