#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_split_inLines() {
  unset testArray
  declare -a testArray=()


  mse_str_split_inLines "testArray" "Isto e apenas um teste para\nverificar como que ficará."

  testResult="${#testArray[@]}"
  testExpected="2"

  mse_utest_assert_equals


  testResult="${testArray[0]}"
  testExpected="Isto e apenas um teste para"

  mse_utest_assert_equals


  testResult="${testArray[1]}"
  testExpected="verificar como que ficará."

  mse_utest_assert_equals




  mse_str_split_inLines "testArray" "Isto é apenas um teste para verificar como que ficará." "10"

  testResult="${#testArray[@]}"
  testExpected="6"

  mse_utest_assert_equals


  testResult="${testArray[0]}"
  testExpected="Isto é"

  mse_utest_assert_equals


  testResult="${testArray[1]}"
  testExpected="apenas um"

  mse_utest_assert_equals


  testResult="${testArray[2]}"
  testExpected="teste para"

  mse_utest_assert_equals


  testResult="${testArray[3]}"
  testExpected="verificar"

  mse_utest_assert_equals


  testResult="${testArray[4]}"
  testExpected="como que"

  mse_utest_assert_equals


  testResult="${testArray[5]}"
  testExpected="ficará."

  mse_utest_assert_equals





  mse_str_split_inLines "testArray" "Isto  é  apenas um teste para verificar como que ficará." "20"

  testResult="${#testArray[@]}"
  testExpected="3"

  mse_utest_assert_equals


  testResult="${testArray[0]}"
  testExpected="Isto  é  apenas um"

  mse_utest_assert_equals


  testResult="${testArray[1]}"
  testExpected="teste para verificar"

  mse_utest_assert_equals


  testResult="${testArray[2]}"
  testExpected="como que ficará."

  mse_utest_assert_equals
}