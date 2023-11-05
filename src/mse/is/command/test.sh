#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_command() {
  testResult=$(mse_is_command "ls --version")
  testExpected="1"

  mse_utest_assert_equals


  testResult=$(mse_is_command "nonexists --version")
  testExpected="0"

  mse_utest_assert_equals
}
