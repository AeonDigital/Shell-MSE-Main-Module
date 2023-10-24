#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_split_inLines() {
  unset testArray
  declare -a testArray=()


  mse_str_split_inLines "testArray" "Isto e apenas um teste para\nverificar como que ficará."

  testResult="${#testArray[@]}"
  testExpected="2"

  mse_md_utest_assertEqual


  testResult="${testArray[0]}"
  testExpected="Isto e apenas um teste para"

  mse_md_utest_assertEqual


  testResult="${testArray[1]}"
  testExpected="verificar como que ficará."

  mse_md_utest_assertEqual




  mse_str_split_inLines "testArray" "Isto é apenas um teste para verificar como que ficará." "10"

  testResult="${#testArray[@]}"
  testExpected="6"

  mse_md_utest_assertEqual


  testResult="${testArray[0]}"
  testExpected="Isto é"

  mse_md_utest_assertEqual


  testResult="${testArray[1]}"
  testExpected="apenas um"

  mse_md_utest_assertEqual


  testResult="${testArray[2]}"
  testExpected="teste para"

  mse_md_utest_assertEqual


  testResult="${testArray[3]}"
  testExpected="verificar"

  mse_md_utest_assertEqual


  testResult="${testArray[4]}"
  testExpected="como que"

  mse_md_utest_assertEqual


  testResult="${testArray[5]}"
  testExpected="ficará."

  mse_md_utest_assertEqual





  mse_str_split_inLines "testArray" "Isto  é  apenas um teste para verificar como que ficará." "20"

  testResult="${#testArray[@]}"
  testExpected="3"

  mse_md_utest_assertEqual


  testResult="${testArray[0]}"
  testExpected="Isto  é  apenas um"

  mse_md_utest_assertEqual


  testResult="${testArray[1]}"
  testExpected="teste para verificar"

  mse_md_utest_assertEqual


  testResult="${testArray[2]}"
  testExpected="como que ficará."

  mse_md_utest_assertEqual
}