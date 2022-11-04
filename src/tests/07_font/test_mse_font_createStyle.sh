#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_font_createStyle() {
  testResult=$(mse_font_createStyle "4" "BOLD" "LBLUE" "WHITE" "0")
  testExpected='e[1;104;37m'

  mse_utest_assertEqual


  testResult=$(mse_font_createStyle "8" "BOLD,underline" "105" "205" "0")
  testExpected='e[1;4;48;5;105;38;5;205m'


  mse_utest_assertEqual


  testResult=$(mse_font_createStyle "32" "DARK,underline" "50;100;150" "250;200;150" "0")
  testExpected='e[2;4;48;2;50;100;150;38;2;250;200;150m'

  mse_utest_assertEqual
}
