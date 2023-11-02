#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_font_create_style() {
  testResult=$(mse_font_create_style "4" "BOLD" "LBLUE" "WHITE" "1")
  testExpected='e[1;104;37m'

  mse_md_utest_assertEqual


  testResult=$(mse_font_create_style "8" "BOLD,underline" "105" "205" "1")
  testExpected='e[1;4;48;5;105;38;5;205m'


  mse_md_utest_assertEqual


  testResult=$(mse_font_create_style "32" "DARK,underline" "50;100;150" "250;200;150" "1")
  testExpected='e[2;4;48;2;50;100;150;38;2;250;200;150m'

  mse_md_utest_assertEqual
}
