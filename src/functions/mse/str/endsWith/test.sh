#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_endsWith() {
  testResult=$(mse_str_endsWith "contains" "if this contains")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_str_endsWith "not" "if not contains")
  testExpected="0"

  mse_md_utest_assertEqual
}
