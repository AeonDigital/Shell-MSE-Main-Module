#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_font_show_colors() {
  testResult="-"
  testExpected="-"

  mse_utest_assert_equals

  #
  # mse_font_show_colors
  # mse_font_show_colors 8 f
  # mse_font_show_colors 8 b
  # mse_font_show_colors 8 b 24
}