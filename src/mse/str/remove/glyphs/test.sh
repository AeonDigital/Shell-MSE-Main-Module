#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_remove_glyphs() {
  testResult=$(mse_str_remove_glyphs "Coração")
  testExpected="Coracao"

  mse_md_utest_assertEqual
}