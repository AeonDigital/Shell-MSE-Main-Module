#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_font_show_characters() {
  testResult="-"
  testExpected="-"

  mse_utest_assert_equals

  #
  # mse_font_show_characters "t"
  # mse_font_show_characters "c"
  # mse_font_show_characters "d"
  # mse_font_show_characters "d" 50 55
}