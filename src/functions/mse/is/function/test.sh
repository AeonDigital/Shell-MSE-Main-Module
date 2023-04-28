#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_function() {
  testResult=$(mse_is_function "nonExists")
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_is_function "test_mse_is_function")
  testExpected="1"

  mse_md_utest_assertEqual
}
