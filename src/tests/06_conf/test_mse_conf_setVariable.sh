#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_setVariable() {
  #
  # Cria/recria um novo arquivo de testes
  cp "src/tests/00_assets/.config" "src/tests/00_assets/expected/setVariable/.config"

  testResult=$(mse_conf_setVariable)
  testExpected="Lost 6 parameters."

  mse_utest_assertEqual


  testResult=$(mse_conf_setVariable "" "" "" "" "" "" "")
  testExpected="Parameter \"PathToFile\" is required"

  mse_utest_assertEqual


  testResult=$(mse_conf_setVariable "src/tests/00_assets/expected/setVariable/.config" "" "" "" "" "" "")
  testExpected="Parameter \"VariableName\" is required"

  mse_utest_assertEqual


  testResult=$(mse_conf_setVariable "src/tests/00_assets/expected/setVariable/.config" "" "GIT_LOG_LENGTH" "" "" "" "")
  testExpected="Parameter \"Operation\" is required"

  mse_utest_assertEqual


  testResult=$(mse_conf_setVariable "src/tests/00_assets/expected/setVariable/.config" "" "GIT_LOG_LENGTH" "ntv_01" "in" "" "")
  testExpected="Parameter \"CommentChar\" is required"

  mse_utest_assertEqual


  testResult=$(mse_conf_setVariable "src/tests/00_assets/expected/setVariable/.config" "" "GIT_LOG_LENGTH" "ntv_01" "in" "#" "in")
  testExpected="Parameter \"Operation\" has an invalid option"

  mse_utest_assertEqual


  testResult=$(mse_conf_setVariable "src/tests/00_assets/expected/setVariable/.config" "" "GIT_LOG_LENGTH" "ntv_01" "a" "#" "in")
  testExpected="Parameter \"Position\" has an invalid option"

  mse_utest_assertEqual


  testResult=$(mse_conf_setVariable "src/tests/00_assets/expected/setVariable/.config" "" "GIT_LOG_LENGTH" "ntv_01" "a" "#")
  testExpected="Variable \"GIT_LOG_LENGTH\" already exists"

  mse_utest_assertEqual


  testResult=$(mse_conf_setVariable "src/tests/00_assets/expected/setVariable/.config" "" "NONEXIST" "ntv_01" "d" "#")
  testExpected="Variable \"NONEXIST\" do not exists"

  mse_utest_assertEqual


  testResult=$(mse_conf_setVariable "src/tests/00_assets/expected/setVariable/.config" "teste" "NONEXIST" "ntv_01" "d" "#")
  testExpected="Variable \"NONEXIST\" do not exists in \"teste\" section"

  mse_utest_assertEqual


  testResult=$(mse_conf_setVariable "src/tests/00_assets/expected/setVariable/.nonexistent" "teste" "NONEXIST" "ntv_01" "d" "#")
  testExpected="Parameter \"PathToFile\" points to a non existent file"

  mse_utest_assertEqual





  #
  # Confirma que a variável ainda não existe no arquivo alvo.
  testResult=$(mse_conf_showVariableLine "src/tests/00_assets/expected/setVariable/.config" "teste" "NEW_TEST_VAR")
  testExpected=""

  mse_utest_assertEqual


  #
  # Adiciona a nova variável
  testResult=$(mse_conf_setVariable "src/tests/00_assets/expected/setVariable/.config" "teste" "NEW_TEST_VAR" "ntv_01" "a" "#" "p")
  testExpected="1"

  mse_utest_assertEqual


  #
  # Confirma que a variável existe no arquivo alvo.
  testResult=$(mse_conf_showVariableLine "src/tests/00_assets/expected/setVariable/.config" "teste" "NEW_TEST_VAR" "1")
  testExpected="56#NEW_TEST_VAR=ntv_01"

  mse_utest_assertEqual





  #
  # Remove a variável
  testResult=$(mse_conf_setVariable "src/tests/00_assets/expected/setVariable/.config" "teste" "NEW_TEST_VAR" "" "d" "#")
  testExpected="1"

  mse_utest_assertEqual


  #
  # Confirma que a variável ainda não existe mains no arquivo alvo.
  testResult=$(mse_conf_showVariableLine "src/tests/00_assets/expected/setVariable/.config" "teste" "NEW_TEST_VAR")
  testExpected=""

  mse_utest_assertEqual





  #
  # Altera o valor da variável
  testResult=$(mse_conf_setVariable "src/tests/00_assets/expected/setVariable/.config" "teste" "GIT_LOG_LENGTH" "50" "ch" "#")
  testExpected="1"

  mse_utest_assertEqual


  #
  # Confirma que a variável foi alterada
  testResult=$(mse_conf_showVariableLine "src/tests/00_assets/expected/setVariable/.config" "teste" "GIT_LOG_LENGTH")
  testExpected="GIT_LOG_LENGTH              =   50"

  mse_utest_assertEqual





  #
  # Comenta a variável
  testResult=$(mse_conf_setVariable "src/tests/00_assets/expected/setVariable/.config" "teste" "GIT_LOG_LENGTH" "" "c" "#")
  testExpected="1"

  mse_utest_assertEqual


  #
  # Confirma que a variável está comentada.
  testResult=$(mse_conf_showVariableLine "src/tests/00_assets/expected/setVariable/.config" "teste" "GIT_LOG_LENGTH")
  testExpected="#GIT_LOG_LENGTH              =   50"

  mse_utest_assertEqual





  #
  # Descomenta a variável
  testResult=$(mse_conf_setVariable "src/tests/00_assets/expected/setVariable/.config" "teste" "GIT_LOG_LENGTH" "" "u" "#")
  testExpected="1"

  mse_utest_assertEqual


  #
  # Confirma que a variável está descomentada.
  testResult=$(mse_conf_showVariableLine "src/tests/00_assets/expected/setVariable/.config" "teste" "GIT_LOG_LENGTH")
  testExpected="GIT_LOG_LENGTH              =   50"

  mse_utest_assertEqual


}
