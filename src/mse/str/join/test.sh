#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_join() {
  myArray=("2022" "12" "22")
  testResult="$(mse_str_join "-" "myArray")"
  testExpected="2022-12-22"

  mse_md_utest_assertEqual


  myArray=("2022" "12" "22")
  testResult="$(mse_str_join "::" "myArray")"
  testExpected="2022::12::22"

  mse_md_utest_assertEqual


  myArray=("2022" "12" "22")
  testResult="$(mse_str_join " : " "myArray")"
  testExpected="2022 : 12 : 22"

  mse_md_utest_assertEqual
}
