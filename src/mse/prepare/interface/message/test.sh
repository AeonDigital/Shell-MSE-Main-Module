#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_prepare_interface_message() {
  unset MSE_MESSAGE_THEME_COLORS
  declare -gA MSE_MESSAGE_THEME_COLORS

  unset MSE_MESSAGE_THEME_CONFIG
  declare -gA MSE_MESSAGE_THEME_CONFIG

  unset MSE_PROMPT_THEME_CONFIG
  declare -gA MSE_PROMPT_THEME_CONFIG

  unset MSE_MESSAGE_THEME_NAME
  MSE_MESSAGE_THEME_NAME="mse_interface_theme_default"





  #
  # Parte 1
  # Testa a função "prepare"
  unset mseTestArrShowMsg
  declare -A mseTestArrShowMsg

  unset mseTestArrBody
  declare -a mseTestArrBody
  mseTestArrBody+=("Primeira linha de informação")
  mseTestArrBody+=("Segunda linha")
  mseTestArrBody+=("Terceira linha")


  #
  # Inicia uma chave que deverá ser excluída pois não é para existir neste
  # tipo de objeto
  mseTestArrShowMsg["teste"]="deve ser excluída após o preparo"

  testResult="${mseTestArrShowMsg[teste]}"
  testExpected="deve ser excluída após o preparo"
  mse_utest_assert_equals


  mse_prepare_interface_message "mseTestArrShowMsg"

  #
  # Atesta que chaves não identificadas serão excluídas
  testResult="${mseTestArrShowMsg["teste"]}"
  testExpected=""
  mse_utest_assert_equals


  unset mseTestExpectedKeys
  declare -a mseTestExpectedKeys
  mseTestExpectedKeys+=("meta_type")
  mseTestExpectedKeys+=("meta_theme")
  mseTestExpectedKeys+=("meta_format")

  mseTestExpectedKeys+=("top_separator_string")
  mseTestExpectedKeys+=("top_separator_color")
  mseTestExpectedKeys+=("top_separator_color_alt")
  mseTestExpectedKeys+=("top_separator_colorize")

  mseTestExpectedKeys+=("title_show")

  mseTestExpectedKeys+=("title_top_separator_string")
  mseTestExpectedKeys+=("title_top_separator_color")
  mseTestExpectedKeys+=("title_top_separator_color_alt")
  mseTestExpectedKeys+=("title_top_separator_colorize")

  mseTestExpectedKeys+=("title_indent")

  mseTestExpectedKeys+=("title_bullet")
  mseTestExpectedKeys+=("title_bullet_color")
  mseTestExpectedKeys+=("title_bullet_color_alt")
  mseTestExpectedKeys+=("title_bullet_colorize")

  mseTestExpectedKeys+=("title_string")
  mseTestExpectedKeys+=("title_string_color")
  mseTestExpectedKeys+=("title_string_color_alt")
  mseTestExpectedKeys+=("title_string_colorize")
  mseTestExpectedKeys+=("title_string_end")

  mseTestExpectedKeys+=("title_bottom_separator_string")
  mseTestExpectedKeys+=("title_bottom_separator_color")
  mseTestExpectedKeys+=("title_bottom_separator_color_alt")
  mseTestExpectedKeys+=("title_bottom_separator_colorize")

  mseTestExpectedKeys+=("body_show")

  mseTestExpectedKeys+=("body_top_separator_string")
  mseTestExpectedKeys+=("body_top_separator_color")
  mseTestExpectedKeys+=("body_top_separator_color_alt")
  mseTestExpectedKeys+=("body_top_separator_colorize")

  mseTestExpectedKeys+=("body_first_line_indent")

  mseTestExpectedKeys+=("body_first_line_bullet")
  mseTestExpectedKeys+=("body_first_line_bullet_color")
  mseTestExpectedKeys+=("body_first_line_bullet_color_alt")
  mseTestExpectedKeys+=("body_first_line_bullet_colorize")

  mseTestExpectedKeys+=("body_lines_indent")

  mseTestExpectedKeys+=("body_lines_bullet")
  mseTestExpectedKeys+=("body_lines_bullet_color")
  mseTestExpectedKeys+=("body_lines_bullet_color_alt")
  mseTestExpectedKeys+=("body_lines_bullet_colorize")

  mseTestExpectedKeys+=("body_lines")
  mseTestExpectedKeys+=("body_lines_color")
  mseTestExpectedKeys+=("body_lines_color_alt")
  mseTestExpectedKeys+=("body_lines_colorize")

  mseTestExpectedKeys+=("body_bottom_separator_string")
  mseTestExpectedKeys+=("body_bottom_separator_color")
  mseTestExpectedKeys+=("body_bottom_separator_color_alt")
  mseTestExpectedKeys+=("body_bottom_separator_colorize")

  mseTestExpectedKeys+=("bottom_separator_string")
  mseTestExpectedKeys+=("bottom_separator_color")
  mseTestExpectedKeys+=("bottom_separator_color_alt")
  mseTestExpectedKeys+=("bottom_separator_colorize")


  local mseTmpK
  for mseTmpK in "${mseTestExpectedKeys[@]}"; do
    testResult=$(mse_array_has_key "${mseTmpK}" "mseTestArrShowMsg")
    testExpected="1"
    mse_utest_assert_equals
  done




  #
  # Parte 2
  # Verifica que, apenas os valores definidos pela função "prepare" possuem valor definido

  #
  # Valores esperados, que devem ser definidos pela "prepare"
  unset mseTestExpectedKeyValues
  declare -A mseTestExpectedKeyValues
  mseTestExpectedKeyValues["meta_type"]="n"
  mseTestExpectedKeyValues["top_separator_colorize"]="0"
  mseTestExpectedKeyValues["title_show"]="0"
  mseTestExpectedKeyValues["title_top_separator_colorize"]="0"
  mseTestExpectedKeyValues["title_bullet_colorize"]="0"
  mseTestExpectedKeyValues["title_string_colorize"]="0"
  mseTestExpectedKeyValues["title_bottom_separator_colorize"]="0"
  mseTestExpectedKeyValues["body_show"]="0"
  mseTestExpectedKeyValues["body_top_separator_colorize"]="0"
  mseTestExpectedKeyValues["body_first_line_bullet_colorize"]="0"
  mseTestExpectedKeyValues["body_lines_bullet_colorize"]="0"
  mseTestExpectedKeyValues["body_lines_colorize"]="0"
  mseTestExpectedKeyValues["body_bottom_separator_colorize"]="0"
  mseTestExpectedKeyValues["bottom_separator_colorize"]="0"


  local mseTmpHasKey
  for mseTmpK in "${mseTestExpectedKeys[@]}"; do
    testResult="${mseTestArrShowMsg[${mseTmpK}]}"
    testExpected=""

    mseTmpHasKey=$(mse_array_has_key "${mseTmpK}" "mseTestExpectedKeyValues")
    if [ "${mseTmpHasKey}" == "1" ]; then
      testExpected="${mseTestExpectedKeyValues[${mseTmpK}]}"
    fi

    mse_utest_assert_equals
  done




  #
  # Parte 3
  # Verifica as alterações de valores das chaves causadas pelo tema e formato escolhidos
  # [valida apenas os campos string e bool... não os que recebem codigos de cores]
  mse_prepare_interface_message "mseTestArrShowMsg" "i" "mse_interface_theme_default" "default"


  unset mseTestExpectedKeyValues
  declare -A mseTestExpectedKeyValues
  mseTestExpectedKeyValues["meta_type"]="i"
  mseTestExpectedKeyValues["meta_theme"]="mse_interface_theme_default"
  mseTestExpectedKeyValues["meta_format"]="default"

  mseTestExpectedKeyValues["top_separator_string"]="\n"
  mseTestExpectedKeyValues["top_separator_colorize"]="0"
  mseTestExpectedKeyValues["title_show"]="1"
  mseTestExpectedKeyValues["title_top_separator_string"]=""
  mseTestExpectedKeyValues["title_top_separator_colorize"]="0"
  mseTestExpectedKeyValues["title_indent"]="  "
  mseTestExpectedKeyValues["title_bullet"]=":: "
  mseTestExpectedKeyValues["title_bullet_colorize"]="0"
  mseTestExpectedKeyValues["title_string_colorize"]="1"
  mseTestExpectedKeyValues["title_string_end"]="\n"
  mseTestExpectedKeyValues["title_bottom_separator_string"]="\n"
  mseTestExpectedKeyValues["title_bottom_separator_colorize"]="0"
  mseTestExpectedKeyValues["body_show"]="1"
  mseTestExpectedKeyValues["body_top_separator_string"]=""
  mseTestExpectedKeyValues["body_top_separator_colorize"]="0"
  mseTestExpectedKeyValues["body_first_line_indent"]="     "
  mseTestExpectedKeyValues["body_first_line_bullet"]=""
  mseTestExpectedKeyValues["body_first_line_bullet_colorize"]="0"
  mseTestExpectedKeyValues["body_lines_indent"]="     "
  mseTestExpectedKeyValues["body_lines_bullet"]=""
  mseTestExpectedKeyValues["body_lines_bullet_colorize"]="0"
  mseTestExpectedKeyValues["body_lines_colorize"]="1"
  mseTestExpectedKeyValues["body_bottom_separator_string"]=""
  mseTestExpectedKeyValues["body_bottom_separator_colorize"]="0"
  mseTestExpectedKeyValues["bottom_separator_string"]="\n"
  mseTestExpectedKeyValues["bottom_separator_colorize"]="0"


  local mseTmpHasKey
  for mseTmpHasKey in "${!mseTestExpectedKeyValues[@]}"; do
    testResult="${mseTestArrShowMsg[${mseTmpHasKey}]}"
    testExpected="${mseTestExpectedKeyValues[${mseTmpHasKey}]}"
    mse_utest_assert_equals
  done



  #
  # Verifica o formato "status"
  mse_prepare_interface_message "mseTestArrShowMsg" "a" "mse_interface_theme_default" "status"


  unset mseTestExpectedKeyValues
  declare -A mseTestExpectedKeyValues
  mseTestExpectedKeyValues["meta_type"]="a"
  mseTestExpectedKeyValues["meta_theme"]="mse_interface_theme_default"
  mseTestExpectedKeyValues["meta_format"]="status"

  mseTestExpectedKeyValues["top_separator_string"]=""
  mseTestExpectedKeyValues["top_separator_colorize"]="0"
  mseTestExpectedKeyValues["title_show"]="1"
  mseTestExpectedKeyValues["title_top_separator_string"]=""
  mseTestExpectedKeyValues["title_top_separator_colorize"]="0"
  mseTestExpectedKeyValues["title_indent"]="  "
  mseTestExpectedKeyValues["title_bullet"]=":: "
  mseTestExpectedKeyValues["title_bullet_colorize"]="0"
  mseTestExpectedKeyValues["title_string_colorize"]="1"
  mseTestExpectedKeyValues["title_string_end"]=""
  mseTestExpectedKeyValues["title_bottom_separator_string"]=""
  mseTestExpectedKeyValues["title_bottom_separator_colorize"]="0"
  mseTestExpectedKeyValues["body_show"]="0"
  mseTestExpectedKeyValues["bottom_separator_string"]=""
  mseTestExpectedKeyValues["bottom_separator_colorize"]="0"


  local mseTmpHasKey
  for mseTmpHasKey in "${!mseTestExpectedKeyValues[@]}"; do
    testResult="${mseTestArrShowMsg[${mseTmpHasKey}]}"
    testExpected="${mseTestExpectedKeyValues[${mseTmpHasKey}]}"

    mse_utest_assert_equals
  done



  #
  # Verifica o formato "title"
  mse_prepare_interface_message "mseTestArrShowMsg" "s" "mse_interface_theme_default" "title"


  unset mseTestExpectedKeyValues
  declare -A mseTestExpectedKeyValues
  mseTestExpectedKeyValues["meta_type"]="s"
  mseTestExpectedKeyValues["meta_theme"]="mse_interface_theme_default"
  mseTestExpectedKeyValues["meta_format"]="title"

  mseTestExpectedKeyValues["top_separator_string"]=""
  mseTestExpectedKeyValues["top_separator_colorize"]="0"
  mseTestExpectedKeyValues["title_show"]="1"
  mseTestExpectedKeyValues["title_top_separator_string"]="\n"
  mseTestExpectedKeyValues["title_top_separator_colorize"]="0"
  mseTestExpectedKeyValues["title_indent"]="  "
  mseTestExpectedKeyValues["title_bullet"]=":: "
  mseTestExpectedKeyValues["title_bullet_colorize"]="0"
  mseTestExpectedKeyValues["title_string_colorize"]="1"
  mseTestExpectedKeyValues["title_string_end"]="\n"
  mseTestExpectedKeyValues["title_bottom_separator_string"]="\n"
  mseTestExpectedKeyValues["title_bottom_separator_colorize"]="0"
  mseTestExpectedKeyValues["body_show"]="0"
  mseTestExpectedKeyValues["bottom_separator_string"]=""
  mseTestExpectedKeyValues["bottom_separator_colorize"]="0"


  local mseTmpHasKey
  for mseTmpHasKey in "${!mseTestExpectedKeyValues[@]}"; do
    testResult="${mseTestArrShowMsg[${mseTmpHasKey}]}"
    testExpected="${mseTestExpectedKeyValues[${mseTmpHasKey}]}"

    mse_utest_assert_equals
  done




  #
  # Parte 4
  # Verifica as alterações de valores das chaves quando definidas diretamente na chamada
  # da função "showMessage"

  #
  # Prepara novamente uma mensagem usando o formato "title"
  mse_prepare_interface_message "mseTestArrShowMsg" "" "mse_interface_theme_default" "status"

  #
  # Atesta as informações que serão posteriormente alteradas
  testResult="${mseTestArrShowMsg[meta_type]}"
  testExpected="n"

  mse_utest_assert_equals


  testResult="${mseTestArrShowMsg[meta_format]}"
  testExpected="status"

  mse_utest_assert_equals


  testResult="${mseTestArrShowMsg[title_string]}"
  testExpected=""

  mse_utest_assert_equals


  testResult="${mseTestArrShowMsg[body_lines]}"
  testExpected=""

  mse_utest_assert_equals


  #
  # Evoca a função principal e redefine os valores possíveis
  mse_interface_show_message "mseTestArrShowMsg" "i" "default" "Local do Título" "mseTestArrBody" &> /dev/null


  #
  # Atesta as informações passadas alteraram o array associativo que configura a mensagem
  testResult="${mseTestArrShowMsg[meta_type]}"
  testExpected="i"

  mse_utest_assert_equals


  testResult="${mseTestArrShowMsg[meta_format]}"
  testExpected="default"

  mse_utest_assert_equals


  testResult="${mseTestArrShowMsg[title_string]}"
  testExpected="Local do Título"

  mse_utest_assert_equals


  testResult="${mseTestArrShowMsg[body_lines]}"
  testExpected="mseTestArrBody"

  mse_utest_assert_equals
}