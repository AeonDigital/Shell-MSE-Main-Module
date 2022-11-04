#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_replacePlaceHolderColor() {
  testResult=$(mse_str_replacePlaceHolderColor "this is a [[PH]] in red" "PH" "test" "${mseRED}")
  testExpected=$(printf "this is a ${mseRED}test${mseNONE} in red")

  mse_utest_assertEqual
}
