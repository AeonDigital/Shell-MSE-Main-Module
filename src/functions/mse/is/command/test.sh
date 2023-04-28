#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_command() {
  testResult=$(mse_is_command 'ls --version')
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_command 'nonexists --version')
  testExpected="0"

  mse_md_utest_assertEqual
}
