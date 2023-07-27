#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_remove_gliphs() {
  testResult=$(mse_str_remove_gliphs "Coração")
  testExpected="Coracao"

  mse_md_utest_assertEqual
}