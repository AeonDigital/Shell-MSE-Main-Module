#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_font_createStyle() {
  testResult=$(mse_font_createStyle "LBLUE" "WHITE" "BOLD" "1")
  testExpected='\\e[1;94;107m'

  mse_utest_assertEqual
}
