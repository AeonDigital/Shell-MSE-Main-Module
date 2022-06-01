#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_file_boundaryLineNumbers() {
  testResult=$(mse_file_boundaryLineNumbers "src/tests/00_assets/.config" "#" "" "" "")
  testExpected="1 58"

  mse_utest_assertEqual


  testResult=$(mse_file_boundaryLineNumbers "src/tests/00_assets/samples/file_read/.bashrc" "#" "0" "# [[INI-MYSHELLENV]]" "# [[END-MYSHELLENV]]")
  testExpected="30 34"

  mse_utest_assertEqual


  testResult=$(mse_file_boundaryLineNumbers "src/tests/00_assets/.config" "#" "1" "email" "")
  testExpected="27 38"

  mse_utest_assertEqual


  testResult=$(mse_file_boundaryLineNumbers "src/tests/00_assets/.config" "#" "1" "teste" "")
  testExpected="55 58"

  mse_utest_assertEqual
}
