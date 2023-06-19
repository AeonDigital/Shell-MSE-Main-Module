#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_split_inLines() {
  mse_str_split_inLines "Isto e apenas um teste para verificar como que ficara." "10"

  testResult="${#MSE_LAST_FUNCTION_RETURN[@]}"
  testExpected="6"

  mse_md_utest_assertEqual


  testResult="${MSE_LAST_FUNCTION_RETURN[0]}"
  testExpected="Isto e"

  mse_md_utest_assertEqual


  testResult="${MSE_LAST_FUNCTION_RETURN[1]}"
  testExpected="apenas um"

  mse_md_utest_assertEqual


  testResult="${MSE_LAST_FUNCTION_RETURN[2]}"
  testExpected="teste para"

  mse_md_utest_assertEqual


  testResult="${MSE_LAST_FUNCTION_RETURN[3]}"
  testExpected="verificar"

  mse_md_utest_assertEqual


  testResult="${MSE_LAST_FUNCTION_RETURN[4]}"
  testExpected="como que"

  mse_md_utest_assertEqual


  testResult="${MSE_LAST_FUNCTION_RETURN[5]}"
  testExpected="ficara."

  mse_md_utest_assertEqual





  mse_str_split_inLines "Isto e apenas um teste para verificar como que ficara." "20"

  testResult="${#MSE_LAST_FUNCTION_RETURN[@]}"
  testExpected="3"

  mse_md_utest_assertEqual


  testResult="${MSE_LAST_FUNCTION_RETURN[0]}"
  testExpected="Isto e apenas um"

  mse_md_utest_assertEqual


  testResult="${MSE_LAST_FUNCTION_RETURN[1]}"
  testExpected="teste para verificar"

  mse_md_utest_assertEqual


  testResult="${MSE_LAST_FUNCTION_RETURN[2]}"
  testExpected="como que ficara."

  mse_md_utest_assertEqual
}