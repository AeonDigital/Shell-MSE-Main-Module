#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_file_write() {
  testResult=$(mse_file_write)
  testExpected="Parameter \"PathToFile\" is required"

  mse_utest_assertEqual


  testResult=$(mse_file_write "src/tests/samples/test_mse_file_write_raw")
  testExpected="Parameter \"ContentArrayName\" is required"

  mse_utest_assertEqual


  testResult=$(mse_file_write "src/tests/samples/test_mse_file_write_raw" "ContentArrayName")
  testExpected="Parameter \"ContentArrayName\" is not an array name"

  mse_utest_assertEqual



  #
  # Cria/recria um novo arquivo de testes
  cp "src/tests/samples/test_mse_file_write_raw" "src/tests/expected/test_mse_file_write_result"

  declare -a ContentArrayName
  ContentArrayName+=("NL: 1")
  ContentArrayName+=("NL: 2")
  ContentArrayName+=("NL: 3")
  testResult=$(mse_file_write "src/tests/expected/test_mse_file_write_result" "ContentArrayName" "not")
  testExpected="Parameter \"ContentArrayName\" has an invalid value"

  mse_utest_assertEqual


  testResult=$(mse_file_write "src/tests/expected/test_mse_file_write_result" "ContentArrayName" "r")
  testExpected="Parameter \"TargetLine\" is required for \"replace\" operation"

  mse_utest_assertEqual


  testResult=$(mse_file_write "src/tests/expected/test_mse_file_write_result" "ContentArrayName" "r" "nonexistent")
  testExpected="Parameter \"TargetLine\" has an invalid value [ Expected a valid function name or line number ]"

  mse_utest_assertEqual


  testResult=$(mse_file_write "src/tests/expected/test_mse_file_write_result" "ContentArrayName" "r" "0")
  testExpected="Parameter \"TargetLine\" has an invalid value [ Outside the file limits; 1 - 5 ]"

  mse_utest_assertEqual




  #
  # Cria/recria um novo arquivo de testes
  cp "src/tests/samples/test_mse_file_write_raw" "src/tests/expected/test_mse_file_write_result"

  testResult=$(mse_file_write "src/tests/expected/test_mse_file_write_result" "ContentArrayName" "p")
  testExpected="1"

  mse_utest_assertEqual

  testResult="$(< "src/tests/expected/test_mse_file_write_result")"
  testExpected="$(< "src/tests/expected/test_mse_file_write_result_1")"

  mse_utest_assertEqual





  #
  # Cria/recria um novo arquivo de testes
  cp "src/tests/samples/test_mse_file_write_raw" "src/tests/expected/test_mse_file_write_result"

  testResult=$(mse_file_write "src/tests/expected/test_mse_file_write_result" "ContentArrayName" "r" "3")
  testExpected="1"

  mse_utest_assertEqual

  testResult="$(< "src/tests/expected/test_mse_file_write_result")"
  testExpected="$(< "src/tests/expected/test_mse_file_write_result_2")"

  mse_utest_assertEqual




  #
  # Cria/recria um novo arquivo de testes
  cp "src/tests/samples/test_mse_file_write_raw" "src/tests/expected/test_mse_file_write_result"

  testResult=$(mse_file_write "src/tests/expected/test_mse_file_write_result" "ContentArrayName" "a")
  testExpected="1"

  mse_utest_assertEqual

  testResult="$(< "src/tests/expected/test_mse_file_write_result")"
  testExpected="$(< "src/tests/expected/test_mse_file_write_result_3")"

  mse_utest_assertEqual
}
