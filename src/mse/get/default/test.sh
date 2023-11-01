#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_get_default() {
  testResult=$(mse_get_default "" "1")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_get_default "2" "1" "0 1")
  testExpected="1"

  mse_md_utest_assertEqual
}
