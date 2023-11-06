#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_split() {
  unset testArray
  declare -a testArray=()

  mse_str_split "testArray" "-" "2022-12-22"

  testResult="${#testArray[@]}"
  testExpected="3"

  mse_utest_assert_equals


  testResult="${testArray[0]}"
  testExpected="2022"

  mse_utest_assert_equals


  testResult="${testArray[1]}"
  testExpected="12"

  mse_utest_assert_equals


  testResult="${testArray[2]}"
  testExpected="22"

  mse_utest_assert_equals



  #
  # Teste com espaços entre os separadores
  mse_str_split "testArray" "-" " 2022 - 12 - 22 "

  testResult="${#testArray[@]}"
  testExpected="3"

  mse_utest_assert_equals


  testResult="==${testArray[0]}=="
  testExpected="== 2022 =="

  mse_utest_assert_equals


  testResult="==${testArray[1]}=="
  testExpected="== 12 =="

  mse_utest_assert_equals


  testResult="==${testArray[2]}=="
  testExpected="== 22 =="

  mse_utest_assert_equals



  #
  # Teste uma separação que permite espaços em branco no array
  # de resposta
  mse_str_split "testArray" " " " primeiro   segundo   terceiro "

  testResult="${#testArray[@]}"
  testExpected="9"

  mse_utest_assert_equals


  mse_str_split "testArray" " " " primeiro   segundo   terceiro " "1"

  testResult="${#testArray[@]}"
  testExpected="3"

  mse_utest_assert_equals





  #
  # Efetua um "trim" nos elementos
  mse_str_split "testArray" "-" " 2022 - 12 - 22 " "1" "1"

  testResult="${#testArray[@]}"
  testExpected="3"

  mse_utest_assert_equals


  testResult="==${testArray[0]}=="
  testExpected="==2022=="

  mse_utest_assert_equals


  testResult="==${testArray[1]}=="
  testExpected="==12=="

  mse_utest_assert_equals


  testResult="==${testArray[2]}=="
  testExpected="==22=="

  mse_utest_assert_equals





  #
  # Verifica se mantém elemento vazio
  mse_str_split "testArray" ":" "options cs:" "0" "1"

  testResult="${#testArray[@]}"
  testExpected="2"

  mse_utest_assert_equals


  testResult="==${testArray[0]}=="
  testExpected="==options cs=="

  mse_utest_assert_equals


  testResult="==${testArray[1]}=="
  testExpected="===="

  mse_utest_assert_equals

}