#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_man() {
  local dir=$(echo "${BASH_SOURCE%/*}")
  local mseSection

  # . src/unittests.sh "mse_man"
  # mse_man "${dir}/attachments/man/pt-br.md" "parameters" "aka hint"


  #
  # Reset all data
  mse_man_reset_data

  testResult="${#MSE_MAN_MAIN_SECTIONS_ORDER[@]}"
  testExpected="0"

  mse_md_utest_assertEqual


  testResult="${#MSE_MAN_MAIN_SECTIONS_DATA[@]}"
  testExpected="0"

  mse_md_utest_assertEqual


  testResult="${#MSE_MAN_GENERIC_SECTION_DATA[@]}"
  testExpected="0"

  mse_md_utest_assertEqual


  testResult="${#MSE_MAN_SECTIONS_ORDER[@]}"
  testExpected="0"

  mse_md_utest_assertEqual


  testResult="${#MSE_MAN_SECTIONS_DATA[@]}"
  testExpected="0"

  mse_md_utest_assertEqual





  #
  # Get main data sections
  mse_man_extract_main_sections_data "${dir}/attachments/man/pt-br.md" ". another"

  testResult="${#MSE_MAN_MAIN_SECTIONS_ORDER[@]}"
  testExpected="3"

  mse_md_utest_assertEqual


  testResult="${#MSE_MAN_MAIN_SECTIONS_DATA[@]}"
  testExpected="3"

  mse_md_utest_assertEqual


  testExpected="1"
  for mseSection in "${MSE_MAN_MAIN_SECTIONS_ORDER[@]}"; do
    testResult="0"
    if [ ! -z "${MSE_MAN_MAIN_SECTIONS_DATA[$mseSection]+x}" ]; then
      testResult="1"
    fi
    mse_md_utest_assertEqual
  done




  #
  # Prepare data section with parameters informations
  mse_man_process_section_generic "MSE_MAN_MAIN_SECTIONS_DATA" "parameters" "1"

  testResult="${#MSE_MAN_GENERIC_SECTION_DATA[@]}"
  testExpected="4"

  mse_md_utest_assertEqual


  declare -a arrExpected=("title" "summary" "description" "subsections")
  testExpected="1"
  for mseSection in "${arrExpected[@]}"; do
    testResult="0"
    if [ ! -z "${MSE_MAN_GENERIC_SECTION_DATA[$mseSection]+x}" ]; then
      testResult="1"
    fi
    mse_md_utest_assertEqual
  done




  #
  # Prepare data section with parameters informations
  mse_man_process_section_data "MSE_MAN_MAIN_SECTIONS_DATA" "parameters" "1"

  # for mseI in "${!MSE_MAN_SECTIONS_ORDER[@]}"; do
  #   mseSection="${MSE_MAN_SECTIONS_ORDER[${mseI}]}"
  #   echo "${mseSection}"
  #   echo "${MSE_MAN_SECTIONS_DATA[${mseSection}]}"
  #   echo "-----------------------"
  # done











  # #
  # # Get main data sections
  # mse_man_process_sections_data

  # testResult="${#MSE_MAN_SECTIONS_ORDER[@]}"
  # testExpected="9"

  # mse_md_utest_assertEqual


  # testResult="${#MSE_MAN_SECTIONS_DATA[@]}"
  # testExpected="9"

  # mse_md_utest_assertEqual


  # echo "${MSE_MAN_SECTIONS_DATA["parameters_subsections"]}"
}
