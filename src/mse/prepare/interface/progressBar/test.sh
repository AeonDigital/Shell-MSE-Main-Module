#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_prepare_interface_progressBar() {
  unset MSE_MESSAGE_THEME_COLORS
  declare -gA MSE_MESSAGE_THEME_COLORS

  unset MSE_PROGRESSBAR_THEME_CONFIG
  declare -gA MSE_PROGRESSBAR_THEME_CONFIG

  unset MSE_MESSAGE_THEME_NAME
  MSE_MESSAGE_THEME_NAME="mse_interface_theme_default"





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
  mse_md_utest_assertEqual


  mse_prepare_interface_progressBar "mseTestArrShowProgressBar"

  #
  # Atesta que chaves não identificadas serão excluídas
  testResult="${mseTestArrShowProgressBar["teste"]}"
  testExpected=""
  mse_md_utest_assertEqual


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
    testResult=$(mse_array_has_key "${mseTmpK}" "mseTestArrShowProgressBar")
    testExpected="1"
    mse_md_utest_assertEqual
  done





  #
  # Parte 2
  # Verifica as alterações de valores das chaves causadas pelo tema e formato escolhidos
  # [valida apenas os campos string e bool... não os que recebem codigos de cores]
  mse_prepare_interface_progressBar "mseTestArrShowProgressBar" "mse_interface_theme_default" "default"


  unset mseTestExpectedKeyValues
  declare -A mseTestExpectedKeyValues
  mseTestExpectedKeyValues["meta_theme"]="mse_interface_theme_default"
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
    mse_md_utest_assertEqual
  done





  #
  # Verifica o formato "onlybar"
  mse_prepare_interface_progressBar "mseTestArrShowProgressBar" "mse_interface_theme_default" "onlybar"


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
    mse_md_utest_assertEqual
  done
}