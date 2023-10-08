#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_bool() {
  testResult=$(mse_is_bool "1")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_bool "0")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_bool "-1")
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_is_bool "-0")
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_is_bool "2")
  testExpected="0"

  mse_md_utest_assertEqual
}
