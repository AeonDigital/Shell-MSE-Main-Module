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

  testResult=$(mse_file_write "src/tests/00_assets/expected/file_write/test_mse_file_write_result" "ContentArrayName" "r")
  testExpected="Parameter \"TargetLine\" is required for \"replace\" operation"

  mse_utest_assertEqual


  testResult=$(mse_file_write "src/tests/00_assets/expected/file_write/test_mse_file_write_result" "ContentArrayName" "r" "invalidfunction")
  testExpected="Parameter \"TargetLine\" has an invalid value [ Expected a function name or one/two integers; \"Received\": \"invalidfunction\"  :: 2 ]"

  mse_utest_assertEqual


  testResult=$(mse_file_write "src/tests/00_assets/expected/file_write/test_mse_file_write_result" "ContentArrayName" "r" "mse_str_trim")
  testExpected="Parameter \"TargetLine\" has an invalid value [ Expected a function name or one/two integers; \"fn mse_str_trim\": \"\"  :: 1 ]"

  mse_utest_assertEqual


  testResult=$(mse_file_write "src/tests/00_assets/expected/file_write/test_mse_file_write_result" "ContentArrayName" "r" "3000")
  testExpected="Parameter \"TargetLine\" has an invalid value [ Outside the file limits; 1 - 7 ]"

  mse_utest_assertEqual


  testResult=$(mse_file_write "src/tests/00_assets/expected/file_write/test_mse_file_write_result" "ContentArrayName" "r" "3")
  testExpected="1"

  mse_utest_assertEqual

  testResult="$(< "src/tests/00_assets/expected/file_write/test_mse_file_write_result")"
  testExpected="$(< "src/tests/00_assets/expected/file_write/test_mse_file_write_result_2")"

  mse_utest_assertEqual




  #
  # Cria/recria um novo arquivo de testes
  cp "src/tests/00_assets/samples/file_write/test_mse_file_write_raw" "src/tests/00_assets/expected/file_write/test_mse_file_write_result"

  testResult=$(mse_file_write "src/tests/00_assets/expected/file_write/test_mse_file_write_result" "ContentArrayName" "r" "")
  testExpected="Parameter \"TargetLine\" has an invalid value [ Expected a function name or one/two integers; \"Received\": \"\"  :: 1 ]"

  mse_utest_assertEqual


  testResult=$(mse_file_write "src/tests/00_assets/expected/file_write/test_mse_file_write_result" "ContentArrayName" "r" "2 4 6")
  testExpected="Parameter \"TargetLine\" has an invalid value [ Expected a function name or one/two integers; \"Received\": \"2 4 6\"  :: 1 ]"

  mse_utest_assertEqual


  testResult=$(mse_file_write "src/tests/00_assets/expected/file_write/test_mse_file_write_result" "ContentArrayName" "r" "a 4")
  testExpected="Parameter \"TargetLine\" has an invalid value [ Expected a function name or one/two integers; \"Received\": \"a 4\"  :: 2 ]"

  mse_utest_assertEqual


  testResult=$(mse_file_write "src/tests/00_assets/expected/file_write/test_mse_file_write_result" "ContentArrayName" "r" "2 b")
  testExpected="Parameter \"TargetLine\" has an invalid value [ Expected a function name or one/two integers; \"Received\": \"2 b\"  :: 3 ]"

  mse_utest_assertEqual


  testResult=$(mse_file_write "src/tests/00_assets/expected/file_write/test_mse_file_write_result" "ContentArrayName" "r" "2 1")
  testExpected="Parameter \"TargetLine\" has an invalid value [ First line must be less than the last: \"2 1\" ]"

  mse_utest_assertEqual


  testResult=$(mse_file_write "src/tests/00_assets/expected/file_write/test_mse_file_write_result" "ContentArrayName" "r" "2 4")
  testExpected="1"

  mse_utest_assertEqual

  testResult="$(< "src/tests/00_assets/expected/file_write/test_mse_file_write_result")"
  testExpected="$(< "src/tests/00_assets/expected/file_write/test_mse_file_write_result_3")"

  mse_utest_assertEqual





  #
  # Cria/recria um novo arquivo de testes
  cp "src/tests/00_assets/samples/file_write/test_mse_file_write_raw" "src/tests/00_assets/expected/file_write/test_mse_file_write_result"

  testResult=$(mse_file_write "src/tests/00_assets/expected/file_write/test_mse_file_write_result" "ContentArrayName" "a")
  testExpected="1"

  mse_utest_assertEqual

  testResult="$(< "src/tests/00_assets/expected/file_write/test_mse_file_write_result")"
  testExpected="$(< "src/tests/00_assets/expected/file_write/test_mse_file_write_result_4")"

  mse_utest_assertEqual





  #
  # Cria/recria um novo arquivo de testes
  cp "src/tests/00_assets/samples/file_write/test_mse_file_write_raw" "src/tests/00_assets/expected/file_write/test_mse_file_write_result"

  testResult=$(mse_file_write "src/tests/00_assets/expected/file_write/test_mse_file_write_result" "ContentArrayName" "d" "2 4")
  testExpected="1"

  mse_utest_assertEqual

  testResult="$(< "src/tests/00_assets/expected/file_write/test_mse_file_write_result")"
  testExpected="$(< "src/tests/00_assets/expected/file_write/test_mse_file_write_result_5")"

  mse_utest_assertEqual
}
