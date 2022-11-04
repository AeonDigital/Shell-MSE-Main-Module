#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_split() {
  mse_str_split "-" "2022-12-22"

  testResult="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"
  testExpected="3"

  mse_utest_assertEqual


  testResult="${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}"
  testExpected="2022"

  mse_utest_assertEqual


  testResult="${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]}"
  testExpected="12"

  mse_utest_assertEqual


  testResult="${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]}"
  testExpected="22"

  mse_utest_assertEqual



  #
  # Teste com espaços entre os separadores
  mse_str_split "-" " 2022 - 12 - 22 "

  testResult="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"
  testExpected="3"

  mse_utest_assertEqual


  testResult="==${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}=="
  testExpected="== 2022 =="

  mse_utest_assertEqual


  testResult="==${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]}=="
  testExpected="== 12 =="

  mse_utest_assertEqual


  testResult="==${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]}=="
  testExpected="== 22 =="

  mse_utest_assertEqual



  #
  # Teste uma separação que permite espaços em branco no array
  # de resposta
  mse_str_split " " " primeiro   segundo   terceiro "

  testResult="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"
  testExpected="8"

  mse_utest_assertEqual


  mse_str_split " " " primeiro   segundo   terceiro " "1"

  testResult="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"
  testExpected="3"

  mse_utest_assertEqual





  #
  # Efetua um "trim" nos elementos
  mse_str_split "-" " 2022 - 12 - 22 " "1" "1"

  testResult="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"
  testExpected="3"

  mse_utest_assertEqual


  testResult="==${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}=="
  testExpected="==2022=="

  mse_utest_assertEqual


  testResult="==${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]}=="
  testExpected="==12=="

  mse_utest_assertEqual


  testResult="==${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]}=="
  testExpected="==22=="

  mse_utest_assertEqual
}
