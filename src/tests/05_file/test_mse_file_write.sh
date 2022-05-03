#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_file_write() {
  declare -a ContentArrayName
  ContentArrayName+=("NL: 1")
  ContentArrayName+=("NL: 2")
  ContentArrayName+=("NL: 3")




  #
  # Cria/recria um novo arquivo de testes
  cp "src/tests/00_assets/samples/file_write/test_mse_file_write_raw" "src/tests/00_assets/expected/file_write/test_mse_file_write_result"

  testResult=$(mse_file_write "src/tests/00_assets/expected/file_write/test_mse_file_write_result" "ContentArrayName" "p")
  testExpected="1"

  mse_utest_assertEqual

  testResult="$(< "src/tests/00_assets/expected/file_write/test_mse_file_write_result")"
  testExpected="$(< "src/tests/00_assets/expected/file_write/test_mse_file_write_result_1")"

  mse_utest_assertEqual





  #
  # Cria/recria um novo arquivo de testes
  cp "src/tests/00_assets/samples/file_write/test_mse_file_write_raw" "src/tests/00_assets/expected/file_write/test_mse_file_write_result"

  testResult=$(mse_file_write "src/tests/00_assets/expected/file_write/test_mse_file_write_result" "ContentArrayName" "r" "3")
  testExpected="1"

  mse_utest_assertEqual

  testResult="$(< "src/tests/00_assets/expected/file_write/test_mse_file_write_result")"
  testExpected="$(< "src/tests/00_assets/expected/file_write/test_mse_file_write_result_2")"

  mse_utest_assertEqual




  #
  # Cria/recria um novo arquivo de testes
  cp "src/tests/00_assets/samples/file_write/test_mse_file_write_raw" "src/tests/00_assets/expected/file_write/test_mse_file_write_result"

  testResult=$(mse_file_write "src/tests/00_assets/expected/file_write/test_mse_file_write_result" "ContentArrayName" "a")
  testExpected="1"

  mse_utest_assertEqual

  testResult="$(< "src/tests/00_assets/expected/file_write/test_mse_file_write_result")"
  testExpected="$(< "src/tests/00_assets/expected/file_write/test_mse_file_write_result_3")"

  mse_utest_assertEqual
}
