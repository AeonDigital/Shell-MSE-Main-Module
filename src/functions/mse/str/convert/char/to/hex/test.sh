#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_char_to_hex() {
  testResult=$(mse_str_convert_char_to_hex "i")
  testExpected="69"

  mse_md_utest_assertEqual


  testResult=$(mse_str_convert_char_to_hex "í")
  testExpected="C3 AD"

  mse_md_utest_assertEqual
}
