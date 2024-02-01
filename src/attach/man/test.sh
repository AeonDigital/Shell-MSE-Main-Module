#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_man() {

  local mseSection


  # 01
  #test_mse_man_reset_data

  # 02
  #test_mse_man_normalize_section_name

  # 03
  #test_mse_man_extract_sections_data

  # 04
  #test_mse_man_process_section_data

  # 05
  #test_mse_man_process_parameters

  # 06
  test_mse_man_compile_data
}





test_mse_man_reset_data() {
  mse_man_reset_data

  testResult="${#MSE_MAN_MAIN_SECTIONS_ORDER[@]}"
  testExpected="0"

  mse_utest_assert_equals


  testResult="${#MSE_MAN_MAIN_SECTIONS_DATA[@]}"
  testExpected="0"

  mse_utest_assert_equals


  testResult="${#MSE_MAN_SECTION_DATA[@]}"
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





test_mse_man_extract_sections_data() {
  mse_man_reset_data
  local dir=$(echo "${BASH_SOURCE%/*}")

  mse_man_extract_sections_data "${dir}/attachments/test/man/pt-br.md"

  testResult="${#MSE_MAN_MAIN_SECTIONS_ORDER[@]}"
  testExpected="7"

  mse_utest_assert_equals


  testResult="${MSE_MAN_MAIN_SECTIONS_ORDER[0]}"
  testExpected="synopsis"

  mse_utest_assert_equals


  testResult="${MSE_MAN_MAIN_SECTIONS_ORDER[1]}"
  testExpected="description"

  mse_utest_assert_equals


  testResult="${MSE_MAN_MAIN_SECTIONS_ORDER[2]}"
  testExpected="parameters"

  mse_utest_assert_equals


  testResult="${MSE_MAN_MAIN_SECTIONS_ORDER[3]}"
  testExpected="examples"

  mse_utest_assert_equals


  testResult="${MSE_MAN_MAIN_SECTIONS_ORDER[4]}"
  testExpected="returns"

  mse_utest_assert_equals


  testResult="${MSE_MAN_MAIN_SECTIONS_ORDER[5]}"
  testExpected="dependencies"

  mse_utest_assert_equals


  testResult="${MSE_MAN_MAIN_SECTIONS_ORDER[6]}"
  testExpected="extra_section"

  mse_utest_assert_equals





  testResult="${#MSE_MAN_MAIN_SECTIONS_DATA[@]}"
  testExpected="7"

  mse_utest_assert_equals


  testExpected="1"
  local mseSection
  for mseSection in "${MSE_MAN_MAIN_SECTIONS_ORDER[@]}"; do
    testResult="0"
    if [ ! -z "${MSE_MAN_MAIN_SECTIONS_DATA[$mseSection]+x}" ]; then
      testResult="1"
    fi
    mse_utest_assert_equals
  done





  for mseSection in "${MSE_MAN_MAIN_SECTIONS_ORDER[@]}"; do
    testResult="${MSE_MAN_MAIN_SECTIONS_DATA[$mseSection]}"
    testExpected=$(< "${dir}/attachments/test/expected/main_sections_data/${mseSection}.txt")

    mse_utest_assert_string_multiline
  done
}





test_mse_man_process_section_data() {
  mse_man_reset_data
  local dir=$(echo "${BASH_SOURCE%/*}")

  mse_man_extract_sections_data "${dir}/attachments/test/man/pt-br.md"





  mse_man_process_section_data "parameters" "1"

  testResult="${#MSE_MAN_SECTION_DATA[@]}"
  testExpected="4"

  mse_utest_assert_equals


  declare -a arrExpected=("title" "summary" "description" "subsections")
  local mseSection

  testExpected="1"
  for mseSection in "${arrExpected[@]}"; do
    testResult="0"
    if [ ! -z "${MSE_MAN_SECTION_DATA[$mseSection]+x}" ]; then
      testResult="1"
    fi
    mse_utest_assert_equals
  done





  for mseSection in "${!MSE_MAN_SECTION_DATA[@]}"; do
    testResult="${MSE_MAN_SECTION_DATA[$mseSection]}"
    testExpected=$(< "${dir}/attachments/test/expected/process_section_generic/parameters_${mseSection}.txt")

    mse_utest_assert_string_multiline
  done
}





test_mse_man_process_parameters() {
  mse_man_reset_data
  local dir=$(echo "${BASH_SOURCE%/*}")

  mse_man_extract_sections_data "${dir}/attachments/test/man/pt-br.md"
  mse_man_process_section_data "parameters" "1"





  mse_man_process_parameters "${MSE_MAN_SECTION_DATA[subsections]}"

  testResult="${#MSE_MAN_PARAMETERS_ORDER[@]}"
  testExpected="6"

  mse_utest_assert_equals



  testExpected="1"
  local mseParameterName
  for mseParameterName in "${MSE_MAN_PARAMETERS_ORDER[@]}"; do
    testResult="0"
    if [ ! -z "${MSE_MAN_PARAMETERS_DATA[$mseParameterName]+x}" ]; then
      testResult="1"
    fi
    mse_utest_assert_equals
  done



  test_mse_man_process_parameters_alpha
  test_mse_man_process_parameters_beta
  test_mse_man_process_parameters_gama
  test_mse_man_process_parameters_delta
  test_mse_man_process_parameters_epsilon
  test_mse_man_process_parameters_zeta
}

test_mse_man_process_parameters_alpha() {
  #
  # @param alpha
  unset mseAssocTest
  declare -A mseAssocTest
  local mseExpectedDescription=""
  local mseExpectedOptionsCS=""
  local mseExpectedOptionsCI=""
  local mseExpectedListCL=""
  local mseExpectedListOP=""
  mseAssocTest["name"]="alpha"
  mseAssocTest["type"]="!bool"
  mseAssocTest["aka"]="-a --alpha"
  mseAssocTest["default"]="${MSE_NULL}"
  mseAssocTest["min"]="${MSE_NULL}"
  mseAssocTest["max"]="${MSE_NULL}"
  mseAssocTest["options_ci"]="${MSE_NULL}"
  mseAssocTest["options_cs"]="${MSE_NULL}"
  mseAssocTest["list_cl"]="${MSE_NULL}"
  mseAssocTest["list_op"]="${MSE_NULL}"
  mseAssocTest["hint"]="Definição simples de um parametro booleano que também é \`nullable\`."
  mseAssocTest["description"]=""

  local mseK
  local msePName="${mseAssocTest["name"]}"
  local msePNameTest=""
  for mseK in "${!mseAssocTest[@]}"; do
    msePNameTest="${msePName}_${mseK}"
    testResult="${MSE_MAN_PARAMETERS_DATA[${msePNameTest}]}"
    testExpected="${mseAssocTest[${mseK}]}"

    if [ "${mseK}" == "hint" ] || [ "${mseK}" == "description" ]; then
      testExpected=$(mse_normalize_string "${mseAssocTest[${mseK}]}")
      mse_utest_assert_string_multiline
    else
      mse_utest_assert_equals
    fi
  done
}
test_mse_man_process_parameters_beta() {
  #
  # @param beta
  unset mseAssocTest
  declare -A mseAssocTest
  local mseExpectedDescription=""
  local mseExpectedOptionsCS=""
  local mseExpectedOptionsCI=""
  local mseExpectedListCL=""
  local mseExpectedListOP=""
  mseAssocTest["name"]="beta"
  mseAssocTest["type"]="int"
  mseAssocTest["aka"]="-b --beta"
  mseAssocTest["default"]="0"
  mseAssocTest["min"]="-10"
  mseAssocTest["max"]="10"
  mseAssocTest["options_ci"]="${MSE_NULL}"
  mseAssocTest["options_cs"]="${MSE_NULL}"
  mseAssocTest["list_cl"]="${MSE_NULL}"
  mseAssocTest["list_op"]="${MSE_NULL}"
  mseAssocTest["hint"]="Parametro que recebe um valor inteiro entre -10 e 10."
  mseAssocTest["description"]="Em caso de valor vazio ou inválido, usará \`0\` como o valor padrão."

  local mseK
  local msePName="${mseAssocTest["name"]}"
  local msePNameTest=""
  for mseK in "${!mseAssocTest[@]}"; do
    msePNameTest="${msePName}_${mseK}"
    testResult="${MSE_MAN_PARAMETERS_DATA[${msePNameTest}]}"
    testExpected="${mseAssocTest[${mseK}]}"

    if [ "${mseK}" == "hint" ] || [ "${mseK}" == "description" ]; then
      testExpected=$(mse_normalize_string "${mseAssocTest[${mseK}]}")
      mse_utest_assert_string_multiline
    else
      mse_utest_assert_equals
    fi
  done
}
test_mse_man_process_parameters_gama() {
  #
  # @param gama
  unset mseAssocTest
  declare -A mseAssocTest
  local mseExpectedDescription=""
  local mseExpectedOptionsCS=""
  local mseExpectedOptionsCI=""
  local mseExpectedListCL=""
  local mseExpectedListOP=""
  mseAssocTest["name"]="gama"
  mseAssocTest["type"]="int"
  mseAssocTest["aka"]="-g --gama"
  mseAssocTest["default"]="${MSE_NULL}"
  mseAssocTest["min"]="${MSE_NULL}"
  mseAssocTest["max"]="${MSE_NULL}"
  mseExpectedOptionsCI+="\n0 : c c++"
  mseExpectedOptionsCI+="\n1 : rust"
  mseExpectedOptionsCI+="\n2 : cobol"
  mseExpectedOptionsCI+="\n3 : clipper"
  mseAssocTest["options_ci"]=${mseExpectedOptionsCI}
  mseAssocTest["options_cs"]="${MSE_NULL}"
  mseAssocTest["list_cl"]="${MSE_NULL}"
  mseAssocTest["list_op"]="${MSE_NULL}"
  mseAssocTest["hint"]="Parametro que possui uma lista fechada de opções válidas."
  mseAssocTest["description"]=""
  mseAssocTest["description"]+="Internamente apenas o valor \`chave\` será usado mas quando usar o autocomplete\n"
  mseAssocTest["description"]+="do MSE o usuário pode selecionar o valor correspondente usando um dos labels\n"
  mseAssocTest["description"]+="associados ao mesmo.\n"
  mseAssocTest["description"]+="\n"
  mseAssocTest["description"]+="Neste caso a lista é avaliada de forma case-insensitive, ou seja:\n"
  mseAssocTest["description"]+="- C = c\n"
  mseAssocTest["description"]+="- Rust = rust = RUST"


  local mseK
  local msePName="${mseAssocTest["name"]}"
  local msePNameTest=""
  for mseK in "${!mseAssocTest[@]}"; do
    msePNameTest="${msePName}_${mseK}"
    testResult="${MSE_MAN_PARAMETERS_DATA[${msePNameTest}]}"
    testExpected="${mseAssocTest[${mseK}]}"

    if [ "${mseK}" == "hint" ] || [ "${mseK}" == "description" ]; then
      testExpected=$(mse_normalize_string "${mseAssocTest[${mseK}]}")
      mse_utest_assert_string_multiline
    else
      mse_utest_assert_equals
    fi
  done
}
test_mse_man_process_parameters_delta() {
  #
  # @param delta
  unset mseAssocTest
  declare -A mseAssocTest
  local mseExpectedDescription=""
  local mseExpectedOptionsCS=""
  local mseExpectedOptionsCI=""
  local mseExpectedListCL=""
  local mseExpectedListOP=""
  mseAssocTest["name"]="delta"
  mseAssocTest["type"]="char"
  mseAssocTest["aka"]="-d --delta"
  mseAssocTest["default"]="${MSE_NULL}"
  mseAssocTest["min"]="${MSE_NULL}"
  mseAssocTest["max"]="${MSE_NULL}"
  mseAssocTest["options_ci"]=${MSE_NULL}
  mseExpectedOptionsCS+="\no: output"
  mseExpectedOptionsCS+="\nO: open"
  mseAssocTest["options_cs"]="${mseExpectedOptionsCS}"
  mseAssocTest["list_cl"]="${MSE_NULL}"
  mseAssocTest["list_op"]="${MSE_NULL}"
  mseAssocTest["hint"]="Outra lista fechada de opções válidas."
  mseExpectedDescription+="Neste caso ocorre avaliação case-sensitive dos valores digitados pelo usuário e\n"
  mseExpectedDescription+="ele precisa digitar um valor que case precisamente com um valor \`chave\` ou com\n"
  mseExpectedDescription+="um dos \`labels\` correspondentes.\n"


  local mseK
  local msePName="${mseAssocTest["name"]}"
  local msePNameTest=""
  for mseK in "${!mseAssocTest[@]}"; do
    msePNameTest="${msePName}_${mseK}"
    testResult="${MSE_MAN_PARAMETERS_DATA[${msePNameTest}]}"
    testExpected="${mseAssocTest[${mseK}]}"

    if [ "${mseK}" == "hint" ] || [ "${mseK}" == "description" ]; then
      testExpected=$(mse_normalize_string "${mseAssocTest[${mseK}]}")
      mse_utest_assert_string_multiline
    else
      mse_utest_assert_equals
    fi
  done
}
test_mse_man_process_parameters_epsilon() {
  #
  # @param epsilon
  unset mseAssocTest
  declare -A mseAssocTest
  local mseExpectedDescription=""
  local mseExpectedOptionsCS=""
  local mseExpectedOptionsCI=""
  local mseExpectedListCL=""
  local mseExpectedListOP=""
  mseAssocTest["name"]="epsilon"
  mseAssocTest["type"]="string"
  mseAssocTest["aka"]="-e --epsilon"
  mseAssocTest["default"]="synopsis"
  mseAssocTest["min"]="${MSE_NULL}"
  mseAssocTest["max"]="${MSE_NULL}"
  mseAssocTest["options_ci"]=${MSE_NULL}
  mseAssocTest["options_cs"]="${MSE_NULL}"
  mseExpectedListCL+="\nsynopsis"
  mseExpectedListCL+="\ndescription"
  mseExpectedListCL+="\nparameters"
  mseExpectedListCL+="\nreturns"
  mseExpectedListCL+="\nexample"
  mseExpectedListCL+="\ndependencies"
  mseAssocTest["list_cl"]="${mseExpectedListCL}"
  mseAssocTest["list_op"]="${MSE_NULL}"
  mseAssocTest["hint"]="Define uma lista fechada de opções dentre as quais o usuário pode selecionar\n"
  mseAssocTest["hint"]+="um ou mais itens (separados por espaços)."
  mseExpectedDescription+="Se desejar, o usuário pode selecionar todos os itens passando como valor o\n"
  mseExpectedDescription+="caracter \`.\`.\n"


  local mseK
  local msePName="${mseAssocTest["name"]}"
  local msePNameTest=""
  for mseK in "${!mseAssocTest[@]}"; do
    msePNameTest="${msePName}_${mseK}"
    testResult="${MSE_MAN_PARAMETERS_DATA[${msePNameTest}]}"
    testExpected="${mseAssocTest[${mseK}]}"

    if [ "${mseK}" == "hint" ] || [ "${mseK}" == "description" ]; then
      testExpected=$(mse_normalize_string "${mseAssocTest[${mseK}]}")
      mse_utest_assert_string_multiline
    else
      mse_utest_assert_equals
    fi
  done
}
test_mse_man_process_parameters_zeta() {
  #
  # @param zeta
  unset mseAssocTest
  declare -A mseAssocTest
  local mseExpectedDescription=""
  local mseExpectedOptionsCS=""
  local mseExpectedOptionsCI=""
  local mseExpectedListCL=""
  local mseExpectedListOP=""
  mseAssocTest["name"]="zeta"
  mseAssocTest["type"]="string"
  mseAssocTest["aka"]="-z --zeta"
  mseAssocTest["default"]="${MSE_NULL}"
  mseAssocTest["min"]="${MSE_NULL}"
  mseAssocTest["max"]="${MSE_NULL}"
  mseAssocTest["options_ci"]=${MSE_NULL}
  mseAssocTest["options_cs"]="${MSE_NULL}"
  mseAssocTest["list_cl"]="${MSE_NULL}"
  mseExpectedListOP+="\nadd"
  mseExpectedListOP+="\nsub"
  mseExpectedListOP+="\nmul"
  mseExpectedListOP+="\ndiv"
  mseAssocTest["list_op"]="${mseExpectedListOP}"
  mseAssocTest["hint"]="Define uma lista aberta de opções dentre as quais o usuário pode selecionar\n"
  mseAssocTest["hint"]+="um ou mais itens, ou ainda incluir opções próprias."
  mseExpectedDescription+="Se desejar, o usuário pode selecionar todos os itens oferecidos pela lista e\n"
  mseExpectedDescription+="ainda adicionar o seu próprio usando por exemplo: \`. mod sqrt\`\n"


  local mseK
  local msePName="${mseAssocTest["name"]}"
  local msePNameTest=""
  for mseK in "${!mseAssocTest[@]}"; do
    msePNameTest="${msePName}_${mseK}"
    testResult="${MSE_MAN_PARAMETERS_DATA[${msePNameTest}]}"
    testExpected="${mseAssocTest[${mseK}]}"

    if [ "${mseK}" == "hint" ] || [ "${mseK}" == "description" ]; then
      testExpected=$(mse_normalize_string "${mseAssocTest[${mseK}]}")
      mse_utest_assert_string_multiline
    else
      mse_utest_assert_equals
    fi
  done
}





test_mse_man_compile_data() {
  local dir=$(echo "${BASH_SOURCE%/*}")

  unset mseAssocCompiledMan
  declare -A mseAssocCompiledMan
  unset mseArrCompileManOrder
  declare -a mseArrCompileManOrder=()

  mse_man_compile_data "${dir}/attachments/test/man/pt-br.md" "mseAssocCompiledMan" "mseArrCompileManOrder"

  echo -e "" > testeman.txt

  printf "%s\n" "${MSE_MAN_PARAMETERS_ORDER[@]}"

  local mseK
  for mseK in "${mseArrCompileManOrder[@]}"; do
    echo -e "#[[  ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----\n${mseK}" >> testeman.txt
    if [ "${mseK}" == "parameters_subsections" ]; then
      echo -e "..." >> testeman.txt
    else
      echo -e "${mseAssocCompiledMan[${mseK}]}" >> testeman.txt
    fi
    echo -e "---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----  ]]#\n\n\n" >> testeman.txt
  done
}