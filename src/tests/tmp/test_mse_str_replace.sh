#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_replace() {
  testResult=$(mse_str_replace "22" "20" "2022-12-22")
  testExpected="2020-12-20"

  mse_utest_assertEqual


  testResult=$(mse_str_replace "/2022" "/2020" "/mnt/e/Projetos/Open Source/Shell-MSE-String/2022-12-22")
  testExpected="/mnt/e/Projetos/Open Source/Shell-MSE-String/2020-12-22"

  mse_utest_assertEqual


  testResult=$(mse_str_replace "/2022-" "/" "/mnt/e/Projetos/Open Source/Shell-MSE-String/2022-12-22")
  testExpected="/mnt/e/Projetos/Open Source/Shell-MSE-String/12-22"

  mse_utest_assertEqual


  testResult=$(mse_str_replace "/2022-" "" "/mnt/e/Projetos/Open Source/Shell-MSE-String/2022-12-22")
  testExpected="/mnt/e/Projetos/Open Source/Shell-MSE-String12-22"

  mse_utest_assertEqual
}
