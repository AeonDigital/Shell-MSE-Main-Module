#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_trimDR() {
  testResult=$(mse_str_trimDR)
  testExpected="Parameter \"Delimiter\" is required"

  mse_utest_assertEqual


  testResult=$(mse_str_trimDR ":")
  testExpected="Parameter \"String\" is required"

  mse_utest_assertEqual


  local testTmp=$(mse_str_trimDR "," "  Keep  calm   ,   and   ... ,   think  ")

  testResult="===${testTmp}==="
  testExpected="===  Keep  calm   ,and   ... ,think  ==="

  mse_utest_assertEqual
}
