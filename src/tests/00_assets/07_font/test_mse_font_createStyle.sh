#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_font_createStyle() {
  testResult=$(mse_font_createStyle "" "BOLD" "LBLUE" "WHITE" "0")
  testExpected='e[1;104;97m'

  mse_utest_assertEqual


  testResult=$(mse_font_createStyle "1" "BOLD,underline" "105" "205" "0")
  testExpected='e[1;4;48;5;105;38;5;205m'

  mse_utest_assertEqual
}
