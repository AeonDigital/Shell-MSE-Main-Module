#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_charHex() {
  testResult=$(mse_is_charHex "69")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_charHex "C3 AD")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_charHex "aj")
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_is_charHex 1x)
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_is_charHex 12b)
  testExpected="0"

  mse_md_utest_assertEqual
}
