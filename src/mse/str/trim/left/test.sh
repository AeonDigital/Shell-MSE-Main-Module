#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_trim_left() {
  local testTmp=$(mse_str_trim_left "   texto   aqui   ")

  testResult="===${testTmp}==="
  testExpected="===texto   aqui   ==="

  mse_utest_assert_equals
}
