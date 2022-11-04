#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_splitInLines() {
  mse_str_splitInLines "Isto e apenas um teste para verificar como que ficara." "10"

  testResult="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"
  testExpected="6"

  mse_utest_assertEqual


  testResult="${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}"
  testExpected="Isto e"

  mse_utest_assertEqual


  testResult="${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]}"
  testExpected="apenas um"

  mse_utest_assertEqual


  testResult="${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]}"
  testExpected="teste para"

  mse_utest_assertEqual


  testResult="${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]}"
  testExpected="verificar"

  mse_utest_assertEqual


  testResult="${MSE_GLOBAL_MODULE_SPLIT_RESULT[4]}"
  testExpected="como que"

  mse_utest_assertEqual


  testResult="${MSE_GLOBAL_MODULE_SPLIT_RESULT[5]}"
  testExpected="ficara."

  mse_utest_assertEqual





  mse_str_splitInLines "Isto e apenas um teste para verificar como que ficara." "20"

  testResult="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"
  testExpected="3"

  mse_utest_assertEqual


  testResult="${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}"
  testExpected="Isto e apenas um"

  mse_utest_assertEqual


  testResult="${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]}"
  testExpected="teste para verificar"

  mse_utest_assertEqual


  testResult="${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]}"
  testExpected="como que ficara."

  mse_utest_assertEqual
}
