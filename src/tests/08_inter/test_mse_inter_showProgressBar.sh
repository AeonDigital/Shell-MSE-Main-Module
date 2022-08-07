#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_inter_showProgressBar() {
  unset MSE_GLOBAL_MAIN_THEME_COLORS
  declare -gA MSE_GLOBAL_MAIN_THEME_COLORS

  unset MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG
  declare -gA MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG

  unset MSE_GLOBAL_THEME_NAME
  MSE_GLOBAL_THEME_NAME="mse_inter_theme_default"


  #
  # Parte 1
  # Testa a função "prepare"
  unset mseTestArrShowProgressBar
  declare -A mseTestArrShowProgressBar


  #
  # Inicia uma chave que deverá ser excluída pois não é para existir neste
  # tipo de objeto
  mseTestArrShowProgressBar["teste"]="deve ser excluída após o preparo"

  testResult="${mseTestArrShowProgressBar[teste]}"
  testExpected="deve ser excluída após o preparo"
  mse_utest_assertEqual


  mse_inter_prepareProgressBar "mseTestArrShowProgressBar"

  #
  # Atesta que chaves não identificadas serão excluídas
  testResult="${mseTestArrShowProgressBar["teste"]}"
  testExpected=""
  mse_utest_assertEqual


  unset mseTestExpectedKeys
  declare -a mseTestExpectedKeys
  mseTestExpectedKeys+=("meta_theme")
  mseTestExpectedKeys+=("meta_format")
  mseTestExpectedKeys+=("meta_indent")

  mseTestExpectedKeys+=("bar_ini_string")
  mseTestExpectedKeys+=("bar_end_string")
  mseTestExpectedKeys+=("bar_fill_char")
  mseTestExpectedKeys+=("bar_max_char_length")
  mseTestExpectedKeys+=("bar_atual_progress")
  mseTestExpectedKeys+=("bar_atual_bar_length")
  mseTestExpectedKeys+=("bar_color")
  mseTestExpectedKeys+=("bar_color_alt")
  mseTestExpectedKeys+=("bar_colorize")

  mseTestExpectedKeys+=("info_show")
  mseTestExpectedKeys+=("info_align")
  mseTestExpectedKeys+=("info_ini_string")
  mseTestExpectedKeys+=("info_end_string")
  mseTestExpectedKeys+=("info_use_percent")
  mseTestExpectedKeys+=("info_data")
  mseTestExpectedKeys+=("info_color")
  mseTestExpectedKeys+=("info_color_alt")
  mseTestExpectedKeys+=("info_colorize")


  local mseTmpK
  for mseTmpK in "${mseTestExpectedKeys[@]}"; do
    testResult=$(mse_check_hasKeyInAssocArray "${mseTmpK}" "mseTestArrShowProgressBar")
    testExpected="1"
    mse_utest_assertEqual
  done





  #
  # Parte 2
  # Verifica as alterações de valores das chaves causadas pelo tema e formato escolhidos
  # [valida apenas os campos string e bool... não os que recebem codigos de cores]
  mse_inter_prepareProgressBar "mseTestArrShowProgressBar" "mse_inter_theme_default" "default"


  unset mseTestExpectedKeyValues
  declare -A mseTestExpectedKeyValues
  mseTestExpectedKeyValues["meta_theme"]="mse_inter_theme_default"
  mseTestExpectedKeyValues["meta_format"]="default"
  mseTestExpectedKeyValues["meta_indent"]="  "


  #
  # Bloco 02: Barra de progresso
  mseTestExpectedKeyValues["bar_ini_string"]="[ "
  mseTestExpectedKeyValues["bar_end_string"]=" ] "
  mseTestExpectedKeyValues["bar_fill_char"]="#"
  mseTestExpectedKeyValues["bar_max_char_length"]="50"
  mseTestExpectedKeyValues["bar_atual_progress"]="0"
  mseTestExpectedKeyValues["bar_atual_bar_length"]="0"
  mseTestExpectedKeyValues["bar_colorize"]="1"


  #
  # Bloco 03: Informações
  mseTestExpectedKeyValues["info_show"]="1"
  mseTestExpectedKeyValues["info_align"]="right"
  mseTestExpectedKeyValues["info_ini_string"]="( "
  mseTestExpectedKeyValues["info_end_string"]=" )"
  mseTestExpectedKeyValues["info_use_percent"]="1"
  mseTestExpectedKeyValues["info_data"]=""
  mseTestExpectedKeyValues["info_colorize"]="1"


  local mseTmpHasKey
  for mseTmpHasKey in "${!mseTestExpectedKeyValues[@]}"; do
    testResult="${mseTestArrShowProgressBar[${mseTmpHasKey}]}"
    testExpected="${mseTestExpectedKeyValues[${mseTmpHasKey}]}"
    mse_utest_assertEqual
  done



  #
  # Verifica o formato "onlybar"
  mse_inter_prepareProgressBar "mseTestArrShowProgressBar" "mse_inter_theme_default" "onlybar"


  unset mseTestExpectedKeyValues
  declare -A mseTestExpectedKeyValues
  mseTestExpectedKeyValues["meta_indent"]="  "


  #
  # Bloco 02: Barra de progresso
  mseTestExpectedKeyValues["bar_ini_string"]="[ "
  mseTestExpectedKeyValues["bar_end_string"]=" ] "
  mseTestExpectedKeyValues["bar_fill_char"]="#"
  mseTestExpectedKeyValues["bar_max_char_length"]="50"
  mseTestExpectedKeyValues["bar_atual_progress"]="0"
  mseTestExpectedKeyValues["bar_atual_bar_length"]="0"
  mseTestExpectedKeyValues["bar_colorize"]="1"


  #
  # Bloco 03: Informações
  mseTestExpectedKeyValues["info_show"]="0"



  local mseTmpHasKey
  for mseTmpHasKey in "${!mseTestExpectedKeyValues[@]}"; do
    testResult="${mseTestArrShowProgressBar[${mseTmpHasKey}]}"
    testExpected="${mseTestExpectedKeyValues[${mseTmpHasKey}]}"
    mse_utest_assertEqual
  done






  #
  # Evoca a função principal
  unset mseTestArrShowProgressBar
  declare -A mseTestArrShowProgressBar
  mse_inter_showProgressBar "mseTestArrShowProgressBar" "default" "50" "10" "l" "teste" &> /dev/null


  #
  # Atesta as informações passadas alteraram o array associativo que configura a mensagem
  testResult="${mseTestArrShowProgressBar[meta_format]}"
  testExpected="default"

  mse_utest_assertEqual


  testResult="${mseTestArrShowProgressBar[bar_max_char_length]}"
  testExpected="50"

  mse_utest_assertEqual


  testResult="${mseTestArrShowProgressBar[bar_atual_progress]}"
  testExpected="10"

  mse_utest_assertEqual


  testResult="${mseTestArrShowProgressBar[info_align]}"
  testExpected="left"

  mse_utest_assertEqual


  testResult="${mseTestArrShowProgressBar[info_data]}"
  testExpected="teste"

  mse_utest_assertEqual





  mse_inter_showProgressBar "mseTestArrShowProgressBar" "onlybar" "55" "30" "l" "teste 02" &> /dev/null

  #
  # Atesta as informações passadas alteraram o array associativo que configura a mensagem
  testResult="${mseTestArrShowProgressBar[meta_format]}"
  testExpected="onlybar"

  mse_utest_assertEqual


  testResult="${mseTestArrShowProgressBar[bar_max_char_length]}"
  testExpected="55"

  mse_utest_assertEqual


  testResult="${mseTestArrShowProgressBar[bar_atual_progress]}"
  testExpected="30"

  mse_utest_assertEqual


  testResult="${mseTestArrShowProgressBar[info_align]}"
  testExpected="right"

  mse_utest_assertEqual


  testResult="${mseTestArrShowProgressBar[info_data]}"
  testExpected=""

  mse_utest_assertEqual



  local mseTestShowProgressBarInShell="0"
  if [ "${mseTestShowProgressBarInShell}" == "1" ]; then
    mse_inter_showProgressBar "mseTestArrShowProgressBar" "default" "60" "0" "right" "Informação adicional"
    sleep 0.5
    mse_inter_updateProgressBar "mseTestArrShowProgressBar" "1"
    sleep 0.5
    mse_inter_updateProgressBar "mseTestArrShowProgressBar" "2"
    sleep 0.5
    mse_inter_updateProgressBar "mseTestArrShowProgressBar" "3"
    sleep 0.5
    mse_inter_updateProgressBar "mseTestArrShowProgressBar" "4"
    sleep 0.5
    mse_inter_updateProgressBar "mseTestArrShowProgressBar" "5"
    sleep 0.5
    mse_inter_updateProgressBar "mseTestArrShowProgressBar" "10" ""
    sleep 0.5
    mse_inter_updateProgressBar "mseTestArrShowProgressBar" "15"
    sleep 0.5
    mse_inter_updateProgressBar "mseTestArrShowProgressBar" "20"
    sleep 0.5
    mse_inter_updateProgressBar "mseTestArrShowProgressBar" "25"
    sleep 0.5
    mse_inter_updateProgressBar "mseTestArrShowProgressBar" "50" "Chegou na metade"
    sleep 0.5
    mse_inter_updateProgressBar "mseTestArrShowProgressBar" "70"
    sleep 0.5
    mse_inter_updateProgressBar "mseTestArrShowProgressBar" "85"
    sleep 0.5
    mse_inter_updateProgressBar "mseTestArrShowProgressBar" "100" "Finalizou"
  fi
}
