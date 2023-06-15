#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_upper() {
  testResult=$(mse_str_upper "convert To Upper Case")
  testExpected="CONVERT TO UPPER CASE"

  mse_md_utest_assertEqual
}
