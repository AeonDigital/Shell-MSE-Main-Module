#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_replacePlaceHolder() {
  testResult=$(mse_str_replacePlaceHolder "this is a [[PH]]" "PH" "test")
  testExpected=$(printf "this is a test")

  mse_utest_assertEqual
}
