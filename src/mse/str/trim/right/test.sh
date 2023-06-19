#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_trim_right() {
  local testTmp=$(mse_str_trim_right "   texto   aqui   ")

  testResult="===${testTmp}==="
  testExpected="===   texto   aqui==="

  mse_md_utest_assertEqual
}
