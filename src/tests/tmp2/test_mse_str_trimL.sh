#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_trimL() {
  testResult=$(mse_str_trimL)
  testExpected="Parameter \"String\" is required"

  mse_utest_assertEqual


  local testTmp=$(mse_str_trimL "   texto   aqui   ")

  testResult="===${testTmp}==="
  testExpected="===texto   aqui   ==="

  mse_utest_assertEqual
}
