#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_startsWith() {
  testResult=$(mse_str_startsWith "if" "if this contains")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_str_startsWith "not" "if not contains")
  testExpected="0"

  mse_md_utest_assertEqual
}
