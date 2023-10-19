#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_toArray() {
  unset testArray
  declare -a testArray=()

  mse_str_convert_toArray "testArray" "one two   tree   ' and four '"
  testResult="${#testArray[@]}"
  testExpected="4"

  mse_md_utest_assertEqual


  testResult="${testArray[0]}"
  testExpected="one"

  mse_md_utest_assertEqual


  testResult="${testArray[1]}"
  testExpected="two"

  mse_md_utest_assertEqual


  testResult="${testArray[2]}"
  testExpected="tree"

  mse_md_utest_assertEqual


  testResult="${testArray[3]}"
  testExpected=" and four "

  mse_md_utest_assertEqual



  mse_str_convert_toArray "testArray" ""
  testResult="${#testArray[@]}"
  testExpected="0"
}