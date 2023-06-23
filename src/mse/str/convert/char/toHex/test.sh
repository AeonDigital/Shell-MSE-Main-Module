#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_char_toHex() {
  testResult=$(mse_str_convert_char_toHex "i")
  testExpected="69"

  mse_md_utest_assertEqual


  testResult=$(mse_str_convert_char_toHex "í")
  testExpected="C3 AD"

  mse_md_utest_assertEqual
}