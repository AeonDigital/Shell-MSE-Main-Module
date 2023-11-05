#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_trim_substring_left() {
  local testTmp=$(mse_str_trim_substring_left "," "  Keep  calm   ,   and   ... ,   think  ")

  testResult="===${testTmp}==="
  testExpected="===  Keep  calm,   and   ...,   think  ==="

  mse_utest_assert_equals
}
