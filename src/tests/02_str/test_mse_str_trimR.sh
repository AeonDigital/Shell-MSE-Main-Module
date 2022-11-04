#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_trimR() {
  local testTmp=$(mse_str_trimR "   texto   aqui   ")

  testResult="===${testTmp}==="
  testExpected="===   texto   aqui==="

  mse_utest_assertEqual
}
