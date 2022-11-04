#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_config_setVariable() {
  #
  # Cria/recria um novo arquivo de testes
  cp "src/tests/00_assets/.config" "src/tests/00_assets/expected/setVariable/.config"





  testResult=$(mse_config_setVariable)
  testExpected="Lost 8 parameters."

  mse_utest_assertEqual


  testResult=$(mse_config_setVariable "" "" "" "" "" "" "" "" "")
  testExpected="Parameter \"PathToFile\" is required"

  mse_utest_assertEqual


  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.nonexistent" "" "" "" "" "" "" "" "")
  testExpected="Parameter \"PathToFile\" points to a non existent file"

  mse_utest_assertEqual


  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "" "1" "" "" "" "" "" "")
  testExpected="Parameter \"CommentChar\" is required"

  mse_utest_assertEqual


  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "#" "" "" "" "" "" "" "")
  testExpected="Parameter \"ConfigFile\" is required"

  mse_utest_assertEqual


  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "#" "a" "" "" "" "" "" "")
  testExpected="Parameter \"ConfigFile\" has an invalid value"

  mse_utest_assertEqual


  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "#" "1" "" "" "" "" "" "")
  testExpected="Parameter \"VarType\" is required"

  mse_utest_assertEqual


  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "#" "1" "" "z" "" "" "" "")
  testExpected="Parameter \"VarType\" has an invalid value"

  mse_utest_assertEqual


  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "#" "1" "" "s" "" "" "" "")
  testExpected="Parameter \"VarName\" is required"

  mse_utest_assertEqual


  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "#" "1" "" "i" "varName" "" "" "")
  testExpected="Parameter \"VarValue\" must be an array"

  mse_utest_assertEqual



  declare -a mseTmpIndexArr=()
  declare -A mseTmpAssocArr
  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "#" "1" "" "i" "varName" "mseTmpAssocArr" "" "")
  testExpected="Parameter \"VarValue\" must be an array"

  mse_utest_assertEqual


  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "#" "1" "" "i" "varName" "mseTmpIndexArr" "" "")
  testExpected="Parameter \"Operation\" has an invalid option"

  mse_utest_assertEqual


  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "#" "1" "" "i" "varName" "mseTmpIndexArr" "a" "z")
  testExpected="Parameter \"Position\" has an invalid option"

  mse_utest_assertEqual





  #
  # ARQUIVOS DE CONFIGURAÇÃO PADRÃO

  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "#" "1" "" "s" "GIT_LOG_LENGTH" "" "a")
  testExpected="Variable \"GIT_LOG_LENGTH\" already exists"

  mse_utest_assertEqual


  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "#" "1" "" "s" "NONEXIST" "" "d")
  testExpected="Variable \"NONEXIST\" do not exists"

  mse_utest_assertEqual


  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "#" "1" "teste" "s" "NONEXIST" "" "d")
  testExpected="Variable \"NONEXIST\" do not exists in \"teste\" section"

  mse_utest_assertEqual





  #
  # Confirma que a variável ainda não existe no arquivo alvo.
  testResult=$(mse_config_showVariableLine "src/tests/00_assets/expected/setVariable/.config" "teste" "NEW_TEST_VAR")
  testExpected=""

  mse_utest_assertEqual


  #
  # Adiciona a nova variável no início da seção
  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "#" "1" "teste" "s" "NEW_TEST_VAR" "ntv_01" "a" "p")
  testExpected="1"

  mse_utest_assertEqual


  #
  # Confirma que a variável existe no arquivo alvo.
  testResult=$(mse_config_showVariableLine "src/tests/00_assets/expected/setVariable/.config" "teste" "NEW_TEST_VAR" "1")
  testExpected="56#NEW_TEST_VAR=ntv_01"

  mse_utest_assertEqual


  #
  # Remove a variável
  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "#" "1" "teste" "s" "NEW_TEST_VAR" "" "d")
  testExpected="1"

  mse_utest_assertEqual


  #
  # Confirma que a variável ainda não existe mais no arquivo alvo.
  testResult=$(mse_config_showVariableLine "src/tests/00_assets/expected/setVariable/.config" "teste" "NEW_TEST_VAR")
  testExpected=""

  mse_utest_assertEqual


  #
  # Altera o valor da variável
  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "#" "1" "teste" "s" "GIT_LOG_LENGTH" "50" "ch")
  testExpected="1"

  mse_utest_assertEqual


  #
  # Confirma que a variável foi alterada
  testResult=$(mse_config_showVariableLine "src/tests/00_assets/expected/setVariable/.config" "teste" "GIT_LOG_LENGTH")
  testExpected="GIT_LOG_LENGTH              =   50"

  mse_utest_assertEqual


  #
  # Comenta a variável
  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "#" "1" "teste" "s" "GIT_LOG_LENGTH" "" "c")
  testExpected="1"

  mse_utest_assertEqual


  #
  # Confirma que a variável está comentada.
  testResult=$(mse_config_showVariableLine "src/tests/00_assets/expected/setVariable/.config" "teste" "GIT_LOG_LENGTH")
  testExpected="#GIT_LOG_LENGTH              =   50"

  mse_utest_assertEqual


  #
  # Descomenta a variável
  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "#" "1" "teste" "s" "GIT_LOG_LENGTH" "" "u")
  testExpected="1"

  mse_utest_assertEqual


  #
  # Confirma que a variável está comentada.
  testResult=$(mse_config_showVariableLine "src/tests/00_assets/expected/setVariable/.config" "teste" "GIT_LOG_LENGTH")
  testExpected="GIT_LOG_LENGTH              =   50"

  mse_utest_assertEqual


  #
  # Adiciona a nova variável no final da seção
  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.config" "#" "1" "teste" "s" "NEW_TEST_VAR" "ntv_01" "a" "a")
  testExpected="1"

  mse_utest_assertEqual


  #
  # Confirma que a variável existe no arquivo alvo.
  testResult=$(mse_config_showVariableLine "src/tests/00_assets/expected/setVariable/.config" "teste" "NEW_TEST_VAR" "1")
  testExpected="59#NEW_TEST_VAR=ntv_01"

  mse_utest_assertEqual




  #
  # ARQUIVOS DE SCRIPT

  #
  # Cria/recria um novo arquivo de testes
  cp "src/tests/00_assets/.bashrc" "src/tests/00_assets/expected/setVariable/.bashrc"


  #
  # Tenta adicionar uma nova variável em um local não existente
  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.bashrc" "#" "0" "" "s" "NONEXIST" "ntv_01" "" "")
  testExpected="Cannot identify the target line to perform this operation."

  mse_utest_assertEqual



  #
  # Escreve uma variável do tipo escalar
  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.bashrc" "#" "0" "" "s" "MSE_UTEST" "ntv_01" "" "")
  testExpected="1"

  mse_utest_assertEqual










  #
  # Prepara o 'reader' para resgatar as linhas afetadas
  # permitindo comparar assim o estado inicial do arquivo de configuração
  unset mseReadOptionsUTest
  declare -A mseReadOptionsUTest
  mse_file_prepareRead "mseReadOptionsUTest"

  mseReadOptionsUTest["block_start_check"]="mse_file_read_checkArbitratySection_start"
  mseReadOptionsUTest["block_start_check_args"]="# [[INI-MSE_UTEST]]"
  mseReadOptionsUTest["block_start_get_first_line"]="1"

  mseReadOptionsUTest["block_end_check"]="mse_file_read_checkArbitratySection_end"
  mseReadOptionsUTest["block_end_check_args"]="# [[END-MSE_UTEST]]"
  mseReadOptionsUTest["block_end_get_last_line"]="1"


  declare -a tmpExpectedLines=()
  tmpExpectedLines=()
  tmpRawExpectedLines+=("# [[INI-MSE_UTEST]]")
  tmpRawExpectedLines+=("MSE_UTEST=ntv_01")
  tmpRawExpectedLines+=("# [[END-MSE_UTEST]]")

  testResult=$(mse_file_read "src/tests/00_assets/expected/setVariable/.bashrc" "mseReadOptionsUTest" "1" "0")
  testExpected=$(printf "%s\n" "${tmpRawExpectedLines[@]}")

  mse_utest_assertEqual
  unset tmpRawExpectedLines



  #
  # Escreve uma variável do tipo array indexado
  unset mseTmpIndexArr
  declare -a mseTmpIndexArr=()
  mseTmpIndexArr=()
  mseTmpIndexArr+=("first")
  mseTmpIndexArr+=("second")

  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.bashrc" "#" "0" "" "i" "MSE_UTEST" "mseTmpIndexArr" "" "")
  testExpected="1"

  mse_utest_assertEqual



  #
  # Verifica se a variável foi escrita conforme o esperado
  declare -a tmpExpectedLines=()
  tmpExpectedLines=()
  tmpRawExpectedLines+=("# [[INI-MSE_UTEST]]")
  tmpRawExpectedLines+=("declare -ga MSE_UTEST")
  tmpRawExpectedLines+=("MSE_UTEST[0]=\"first\"")
  tmpRawExpectedLines+=("MSE_UTEST[1]=\"second\"")
  tmpRawExpectedLines+=("# [[END-MSE_UTEST]]")

  testResult=$(mse_file_read "src/tests/00_assets/expected/setVariable/.bashrc" "mseReadOptionsUTest" "1" "0")
  testExpected=$(printf "%s\n" "${tmpRawExpectedLines[@]}")

  mse_utest_assertEqual
  unset tmpRawExpectedLines










  #
  # Escreve uma variável do tipo array associativo
  unset mseTmpAssocArr
  declare -A mseTmpAssocArr
  mseTmpAssocArr["first"]="one"
  mseTmpAssocArr["second"]="two"
  testResult=$(mse_config_setVariable "src/tests/00_assets/expected/setVariable/.bashrc" "#" "0" "" "a" "MSE_UTEST" "mseTmpAssocArr" "" "")
  testExpected="1"

  mse_utest_assertEqual



  #
  # Verifica se a variável foi escrita conforme o esperado
  declare -a tmpExpectedLines=()
  tmpExpectedLines=()
  tmpRawExpectedLines+=("# [[INI-MSE_UTEST]]")
  tmpRawExpectedLines+=("declare -gA MSE_UTEST")
  tmpRawExpectedLines+=("MSE_UTEST[\"first\"]=\"one\"")
  tmpRawExpectedLines+=("MSE_UTEST[\"second\"]=\"two\"")
  tmpRawExpectedLines+=("# [[END-MSE_UTEST]]")

  testResult=$(mse_file_read "src/tests/00_assets/expected/setVariable/.bashrc" "mseReadOptionsUTest" "1" "0")
  testExpected=$(printf "%s\n" "${tmpRawExpectedLines[@]}")

  mse_utest_assertEqual
  unset tmpRawExpectedLines
}
