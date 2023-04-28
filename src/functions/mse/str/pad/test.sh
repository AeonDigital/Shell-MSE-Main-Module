#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_pad() {
  testResult=$(mse_str_pad "32" "0" "5" "r")
  testExpected="32000"

  mse_md_utest_assertEqual


  testResult=$(mse_str_pad "32" "0" "5" "l")
  testExpected="00032"

  mse_md_utest_assertEqual


  testResult=$(mse_str_pad "32" " " "5" "r")
  testExpected="32   "

  mse_md_utest_assertEqual


  testResult=$(mse_str_pad "é" " " "5" "l")
  testExpected="    é"

  mse_md_utest_assertEqual
}
