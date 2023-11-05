#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_man() {

  local mseSection


  # 01
  #test_mse_man_reset_data

  # 02
  #test_mse_man_normalize_section_name

  # 03
  test_mse_man_extract_main_sections_data


  # - mse_man_process_section_generic
  # - mse_man_process_parameters
  # - mse_man_process_section_data


  # . src/unittests.sh "mse_man"
  # mse_man "${dir}/attachments/man/pt-br.md" "parameters" "aka hint"









  # #
  # # Prepare data section with parameters informations
  # mse_man_process_section_generic "MSE_MAN_MAIN_SECTIONS_DATA" "parameters" "1"

  # testResult="${#MSE_MAN_GENERIC_SECTION_DATA[@]}"
  # testExpected="4"

  # mse_utest_assert_equals


  # declare -a arrExpected=("title" "summary" "description" "subsections")
  # testExpected="1"
  # for mseSection in "${arrExpected[@]}"; do
  #   testResult="0"
  #   if [ ! -z "${MSE_MAN_GENERIC_SECTION_DATA[$mseSection]+x}" ]; then
  #     testResult="1"
  #   fi
  #   mse_utest_assert_equals
  # done




  # #
  # # Prepare data section with parameters informations
  # mse_man_process_section_data "MSE_MAN_MAIN_SECTIONS_DATA" "parameters" "1"

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

  # mse_utest_assert_equals


  # testResult="${#MSE_MAN_SECTIONS_DATA[@]}"
  # testExpected="9"

  # mse_utest_assert_equals


  # echo "${MSE_MAN_SECTIONS_DATA["parameters_subsections"]}"
}




test_mse_man_reset_data() {
  mse_man_reset_data

  testResult="${#MSE_MAN_MAIN_SECTIONS_ORDER[@]}"
  testExpected="0"

  mse_utest_assert_equals


  testResult="${#MSE_MAN_MAIN_SECTIONS_DATA[@]}"
  testExpected="0"

  mse_utest_assert_equals


  testResult="${#MSE_MAN_GENERIC_SECTION_DATA[@]}"
  testExpected="0"

  mse_utest_assert_equals


  testResult="${#MSE_MAN_SECTIONS_ORDER[@]}"
  testExpected="0"

  mse_utest_assert_equals


  testResult="${#MSE_MAN_SECTIONS_DATA[@]}"
  testExpected="0"

  mse_utest_assert_equals
}



test_mse_man_normalize_section_name() {
  testResult=$(mse_man_normalize_section_name "# Parameters")
  testExpected="parameters"

  mse_utest_assert_equals


  testResult=$(mse_man_normalize_section_name "### Seção com Acentuação e espaços")
  testExpected="secao_com_acentuacao_e_espacos"

  mse_utest_assert_equals
}



test_mse_man_extract_main_sections_data() {
  local dir=$(echo "${BASH_SOURCE%/*}")

  mse_man_extract_main_sections_data "${dir}/attachments/test/man/pt-br.md" ". 'Extra section'"

  # testResult="${#MSE_MAN_MAIN_SECTIONS_ORDER[@]}"
  # testExpected="7"

  # mse_utest_assert_equals


  # testResult="${MSE_MAN_MAIN_SECTIONS_ORDER[0]}"
  # testExpected="synopsis"

  # mse_utest_assert_equals


  # testResult="${MSE_MAN_MAIN_SECTIONS_ORDER[1]}"
  # testExpected="description"

  # mse_utest_assert_equals


  # testResult="${MSE_MAN_MAIN_SECTIONS_ORDER[2]}"
  # testExpected="parameters"

  # mse_utest_assert_equals


  # testResult="${MSE_MAN_MAIN_SECTIONS_ORDER[3]}"
  # testExpected="examples"

  # mse_utest_assert_equals


  # testResult="${MSE_MAN_MAIN_SECTIONS_ORDER[4]}"
  # testExpected="returns"

  # mse_utest_assert_equals


  # testResult="${MSE_MAN_MAIN_SECTIONS_ORDER[5]}"
  # testExpected="dependencies"

  # mse_utest_assert_equals


  # testResult="${MSE_MAN_MAIN_SECTIONS_ORDER[6]}"
  # testExpected="extra_section"

  # mse_utest_assert_equals





  # testResult="${#MSE_MAN_MAIN_SECTIONS_DATA[@]}"
  # testExpected="7"

  # mse_utest_assert_equals


  # testExpected="1"
  # local mseSection
  # for mseSection in "${MSE_MAN_MAIN_SECTIONS_ORDER[@]}"; do
  #   testResult="0"
  #   if [ ! -z "${MSE_MAN_MAIN_SECTIONS_DATA[$mseSection]+x}" ]; then
  #     testResult="1"
  #   fi
  #   mse_utest_assert_equals
  # done





  for mseSection in "${MSE_MAN_MAIN_SECTIONS_ORDER[@]}"; do
    testResult="${MSE_MAN_MAIN_SECTIONS_DATA[$mseSection]}"
    testExpected=$(< "${dir}/attachments/test/expected/main_sections_data/${mseSection}.txt")

    mse_md_utest_assertMultilineText
  done
}