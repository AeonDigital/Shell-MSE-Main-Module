#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_inter_showMessage() {
  unset MSE_GLOBAL_MAIN_THEME_COLORS
  declare -gA MSE_GLOBAL_MAIN_THEME_COLORS

  unset MSE_GLOBAL_SHOW_MESSAGE_CONFIG
  declare -gA MSE_GLOBAL_SHOW_MESSAGE_CONFIG

  unset MSE_GLOBAL_SHOW_PROMPT_CONFIG
  declare -gA MSE_GLOBAL_SHOW_PROMPT_CONFIG

  unset MSE_GLOBAL_THEME_NAME
  MSE_GLOBAL_THEME_NAME="mse_inter_theme_default"


  # #
  # # Parte 1
  # # Testa a função "prepare"
  # unset mseTestArrShowMsg
  # declare -A mseTestArrShowMsg

  # unset mseTestArrBody
  # declare -a mseTestArrBody
  # mseTestArrBody+=("Primeira linha de informação")
  # mseTestArrBody+=("Segunda linha")
  # mseTestArrBody+=("Terceira linha")


  # #
  # # Inicia uma chave que deverá ser excluída pois não é para existir neste
  # # tipo de objeto
  # mseTestArrShowMsg["teste"]="deve ser excluída após o preparo"

  # testResult="${mseTestArrShowMsg[teste]}"
  # testExpected="deve ser excluída após o preparo"
  # mse_utest_assertEqual


  # mse_inter_prepareMessage "mseTestArrShowMsg"

  # #
  # # Atesta que chaves não identificadas serão excluídas
  # testResult="${mseTestArrShowMsg["teste"]}"
  # testExpected=""
  # mse_utest_assertEqual


  # unset mseTestExpectedKeys
  # declare -a mseTestExpectedKeys
  # mseTestExpectedKeys+=("meta_type")
  # mseTestExpectedKeys+=("meta_theme")
  # mseTestExpectedKeys+=("meta_format")

  # mseTestExpectedKeys+=("top_separator_string")
  # mseTestExpectedKeys+=("top_separator_color")
  # mseTestExpectedKeys+=("top_separator_color_alt")
  # mseTestExpectedKeys+=("top_separator_colorize")

  # mseTestExpectedKeys+=("title_show")

  # mseTestExpectedKeys+=("title_top_separator_string")
  # mseTestExpectedKeys+=("title_top_separator_color")
  # mseTestExpectedKeys+=("title_top_separator_color_alt")
  # mseTestExpectedKeys+=("title_top_separator_colorize")

  # mseTestExpectedKeys+=("title_indent")

  # mseTestExpectedKeys+=("title_bullet")
  # mseTestExpectedKeys+=("title_bullet_color")
  # mseTestExpectedKeys+=("title_bullet_color_alt")
  # mseTestExpectedKeys+=("title_bullet_colorize")

  # mseTestExpectedKeys+=("title_string")
  # mseTestExpectedKeys+=("title_string_color")
  # mseTestExpectedKeys+=("title_string_color_alt")
  # mseTestExpectedKeys+=("title_string_colorize")
  # mseTestExpectedKeys+=("title_string_end")

  # mseTestExpectedKeys+=("title_bottom_separator_string")
  # mseTestExpectedKeys+=("title_bottom_separator_color")
  # mseTestExpectedKeys+=("title_bottom_separator_color_alt")
  # mseTestExpectedKeys+=("title_bottom_separator_colorize")

  # mseTestExpectedKeys+=("body_show")

  # mseTestExpectedKeys+=("body_top_separator_string")
  # mseTestExpectedKeys+=("body_top_separator_color")
  # mseTestExpectedKeys+=("body_top_separator_color_alt")
  # mseTestExpectedKeys+=("body_top_separator_colorize")

  # mseTestExpectedKeys+=("body_first_line_indent")

  # mseTestExpectedKeys+=("body_first_line_bullet")
  # mseTestExpectedKeys+=("body_first_line_bullet_color")
  # mseTestExpectedKeys+=("body_first_line_bullet_color_alt")
  # mseTestExpectedKeys+=("body_first_line_bullet_colorize")

  # mseTestExpectedKeys+=("body_lines_indent")

  # mseTestExpectedKeys+=("body_lines_bullet")
  # mseTestExpectedKeys+=("body_lines_bullet_color")
  # mseTestExpectedKeys+=("body_lines_bullet_color_alt")
  # mseTestExpectedKeys+=("body_lines_bullet_colorize")

  # mseTestExpectedKeys+=("body_lines")
  # mseTestExpectedKeys+=("body_lines_color")
  # mseTestExpectedKeys+=("body_lines_color_alt")
  # mseTestExpectedKeys+=("body_lines_colorize")

  # mseTestExpectedKeys+=("body_bottom_separator_string")
  # mseTestExpectedKeys+=("body_bottom_separator_color")
  # mseTestExpectedKeys+=("body_bottom_separator_color_alt")
  # mseTestExpectedKeys+=("body_bottom_separator_colorize")

  # mseTestExpectedKeys+=("bottom_separator_string")
  # mseTestExpectedKeys+=("bottom_separator_color")
  # mseTestExpectedKeys+=("bottom_separator_color_alt")
  # mseTestExpectedKeys+=("bottom_separator_colorize")


  # local mseTmpK
  # for mseTmpK in "${mseTestExpectedKeys[@]}"; do
  #   testResult=$(mse_check_hasKeyInAssocArray "${mseTmpK}" "mseTestArrShowMsg")
  #   testExpected="1"
  #   mse_utest_assertEqual
  # done




  # #
  # # Parte 2
  # # Verifica que, apenas os valores definidos pela função "prepare" possuem valor definido

  # #
  # # Valores esperados, que devem ser definidos pela "prepare"
  # unset mseTestExpectedKeyValues
  # declare -A mseTestExpectedKeyValues
  # mseTestExpectedKeyValues["meta_type"]="none"
  # mseTestExpectedKeyValues["top_separator_colorize"]="0"
  # mseTestExpectedKeyValues["title_show"]="0"
  # mseTestExpectedKeyValues["title_top_separator_colorize"]="0"
  # mseTestExpectedKeyValues["title_bullet_colorize"]="0"
  # mseTestExpectedKeyValues["title_string_colorize"]="0"
  # mseTestExpectedKeyValues["title_bottom_separator_colorize"]="0"
  # mseTestExpectedKeyValues["body_show"]="0"
  # mseTestExpectedKeyValues["body_top_separator_colorize"]="0"
  # mseTestExpectedKeyValues["body_first_line_bullet_colorize"]="0"
  # mseTestExpectedKeyValues["body_lines_bullet_colorize"]="0"
  # mseTestExpectedKeyValues["body_lines_colorize"]="0"
  # mseTestExpectedKeyValues["body_bottom_separator_colorize"]="0"
  # mseTestExpectedKeyValues["bottom_separator_colorize"]="0"


  # local mseTmpHasKey
  # for mseTmpK in "${mseTestExpectedKeys[@]}"; do
  #   testResult="${mseTestArrShowMsg[${mseTmpK}]}"
  #   testExpected=""

  #   mseTmpHasKey=$(mse_check_hasKeyInAssocArray "${mseTmpK}" "mseTestExpectedKeyValues")
  #   if [ "${mseTmpHasKey}" == "1" ]; then
  #     testExpected="${mseTestExpectedKeyValues[${mseTmpK}]}"
  #   fi

  #   mse_utest_assertEqual
  # done




  # #
  # # Parte 3
  # # Verifica as alterações de valores das chaves causadas pelo tema e formato escolhidos
  # # [valida apenas os campos string e bool... não os que recebem codigos de cores]
  # mse_inter_prepareMessage "mseTestArrShowMsg" "i" "mse_inter_theme_default" "default"


  # unset mseTestExpectedKeyValues
  # declare -A mseTestExpectedKeyValues
  # mseTestExpectedKeyValues["meta_type"]="info"
  # mseTestExpectedKeyValues["meta_theme"]="mse_inter_theme_default"
  # mseTestExpectedKeyValues["meta_format"]="default"

  # mseTestExpectedKeyValues["top_separator_string"]="\n"
  # mseTestExpectedKeyValues["top_separator_colorize"]="0"
  # mseTestExpectedKeyValues["title_show"]="1"
  # mseTestExpectedKeyValues["title_top_separator_string"]=""
  # mseTestExpectedKeyValues["title_top_separator_colorize"]="0"
  # mseTestExpectedKeyValues["title_indent"]="  "
  # mseTestExpectedKeyValues["title_bullet"]=":: "
  # mseTestExpectedKeyValues["title_bullet_colorize"]="0"
  # mseTestExpectedKeyValues["title_string_colorize"]="1"
  # mseTestExpectedKeyValues["title_string_end"]="\n"
  # mseTestExpectedKeyValues["title_bottom_separator_string"]="\n"
  # mseTestExpectedKeyValues["title_bottom_separator_colorize"]="0"
  # mseTestExpectedKeyValues["body_show"]="1"
  # mseTestExpectedKeyValues["body_top_separator_string"]=""
  # mseTestExpectedKeyValues["body_top_separator_colorize"]="0"
  # mseTestExpectedKeyValues["body_first_line_indent"]="     "
  # mseTestExpectedKeyValues["body_first_line_bullet"]=""
  # mseTestExpectedKeyValues["body_first_line_bullet_colorize"]="0"
  # mseTestExpectedKeyValues["body_lines_indent"]="     "
  # mseTestExpectedKeyValues["body_lines_bullet"]=""
  # mseTestExpectedKeyValues["body_lines_bullet_colorize"]="0"
  # mseTestExpectedKeyValues["body_lines_colorize"]="1"
  # mseTestExpectedKeyValues["body_bottom_separator_string"]=""
  # mseTestExpectedKeyValues["body_bottom_separator_colorize"]="0"
  # mseTestExpectedKeyValues["bottom_separator_string"]="\n"
  # mseTestExpectedKeyValues["bottom_separator_colorize"]="0"


  # local mseTmpHasKey
  # for mseTmpHasKey in "${!mseTestExpectedKeyValues[@]}"; do
  #   testResult="${mseTestArrShowMsg[${mseTmpHasKey}]}"
  #   testExpected="${mseTestExpectedKeyValues[${mseTmpHasKey}]}"
  #   mse_utest_assertEqual
  # done



  # #
  # # Verifica o formato "status"
  # mse_inter_prepareMessage "mseTestArrShowMsg" "a" "mse_inter_theme_default" "status"


  # unset mseTestExpectedKeyValues
  # declare -A mseTestExpectedKeyValues
  # mseTestExpectedKeyValues["meta_type"]="attention"
  # mseTestExpectedKeyValues["meta_theme"]="mse_inter_theme_default"
  # mseTestExpectedKeyValues["meta_format"]="status"

  # mseTestExpectedKeyValues["top_separator_string"]=""
  # mseTestExpectedKeyValues["top_separator_colorize"]="0"
  # mseTestExpectedKeyValues["title_show"]="1"
  # mseTestExpectedKeyValues["title_top_separator_string"]=""
  # mseTestExpectedKeyValues["title_top_separator_colorize"]="0"
  # mseTestExpectedKeyValues["title_indent"]="  "
  # mseTestExpectedKeyValues["title_bullet"]=":: "
  # mseTestExpectedKeyValues["title_bullet_colorize"]="0"
  # mseTestExpectedKeyValues["title_string_colorize"]="1"
  # mseTestExpectedKeyValues["title_string_end"]=""
  # mseTestExpectedKeyValues["title_bottom_separator_string"]=""
  # mseTestExpectedKeyValues["title_bottom_separator_colorize"]="0"
  # mseTestExpectedKeyValues["body_show"]="0"
  # mseTestExpectedKeyValues["bottom_separator_string"]=""
  # mseTestExpectedKeyValues["bottom_separator_colorize"]="0"


  # local mseTmpHasKey
  # for mseTmpHasKey in "${!mseTestExpectedKeyValues[@]}"; do
  #   testResult="${mseTestArrShowMsg[${mseTmpHasKey}]}"
  #   testExpected="${mseTestExpectedKeyValues[${mseTmpHasKey}]}"

  #   mse_utest_assertEqual
  # done



  # #
  # # Verifica o formato "title"
  # mse_inter_prepareMessage "mseTestArrShowMsg" "s" "mse_inter_theme_default" "title"


  # unset mseTestExpectedKeyValues
  # declare -A mseTestExpectedKeyValues
  # mseTestExpectedKeyValues["meta_type"]="success"
  # mseTestExpectedKeyValues["meta_theme"]="mse_inter_theme_default"
  # mseTestExpectedKeyValues["meta_format"]="title"

  # mseTestExpectedKeyValues["top_separator_string"]=""
  # mseTestExpectedKeyValues["top_separator_colorize"]="0"
  # mseTestExpectedKeyValues["title_show"]="1"
  # mseTestExpectedKeyValues["title_top_separator_string"]="\n"
  # mseTestExpectedKeyValues["title_top_separator_colorize"]="0"
  # mseTestExpectedKeyValues["title_indent"]="  "
  # mseTestExpectedKeyValues["title_bullet"]=":: "
  # mseTestExpectedKeyValues["title_bullet_colorize"]="0"
  # mseTestExpectedKeyValues["title_string_colorize"]="1"
  # mseTestExpectedKeyValues["title_string_end"]="\n"
  # mseTestExpectedKeyValues["title_bottom_separator_string"]="\n"
  # mseTestExpectedKeyValues["title_bottom_separator_colorize"]="0"
  # mseTestExpectedKeyValues["body_show"]="0"
  # mseTestExpectedKeyValues["bottom_separator_string"]=""
  # mseTestExpectedKeyValues["bottom_separator_colorize"]="0"


  # local mseTmpHasKey
  # for mseTmpHasKey in "${!mseTestExpectedKeyValues[@]}"; do
  #   testResult="${mseTestArrShowMsg[${mseTmpHasKey}]}"
  #   testExpected="${mseTestExpectedKeyValues[${mseTmpHasKey}]}"

  #   mse_utest_assertEqual
  # done




  # #
  # # Parte 4
  # # Verifica as alterações de valores das chaves quando definidas diretamente na chamada
  # # da função "showMessage"

  # #
  # # Prepara novamente uma mensagem usando o formato "title"
  # mse_inter_prepareMessage "mseTestArrShowMsg" "" "mse_inter_theme_default" "status"

  # #
  # # Atesta as informações que serão posteriormente alteradas
  # testResult="${mseTestArrShowMsg[meta_type]}"
  # testExpected="none"

  # mse_utest_assertEqual


  # testResult="${mseTestArrShowMsg[meta_format]}"
  # testExpected="status"

  # mse_utest_assertEqual


  # testResult="${mseTestArrShowMsg[title_string]}"
  # testExpected=""

  # mse_utest_assertEqual


  # testResult="${mseTestArrShowMsg[body_lines]}"
  # testExpected=""

  # mse_utest_assertEqual


  # #
  # # Evoca a função principal e redefine os valores possíveis
  # mse_inter_showMessage "mseTestArrShowMsg" "i" "default" "Local do Título" "mseTestArrBody" &> /dev/null


  # #
  # # Atesta as informações passadas alteraram o array associativo que configura a mensagem
  # testResult="${mseTestArrShowMsg[meta_type]}"
  # testExpected="info"

  # mse_utest_assertEqual


  # testResult="${mseTestArrShowMsg[meta_format]}"
  # testExpected="default"

  # mse_utest_assertEqual


  # testResult="${mseTestArrShowMsg[title_string]}"
  # testExpected="Local do Título"

  # mse_utest_assertEqual


  # testResult="${mseTestArrShowMsg[body_lines]}"
  # testExpected="mseTestArrBody"

  # mse_utest_assertEqual




  local mseTestShowMessageInShell="0"
  if [ "${mseTestShowMessageInShell}" == "1" ]; then

    echo "---"
    # Mensagem sem nada... apenas atesta que usará o formato "title"
    mse_inter_showMessage
    echo "--- ${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[meta_type]} :: ${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[meta_format]} :: ${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[title_type]} ---"

    # Mensagem do tipo "attention"... atesta o título padrão e a coloração
    mse_inter_showMessage "mseTestArrShowMsg" "a"
    echo "--- ${mseTestArrShowMsg[meta_type]} :: ${mseTestArrShowMsg[meta_format]} :: ${mseTestArrShowMsg[title_type]} ---"

    # Confirma que mesmo forçando o formato "default" irá mostrar um "title" visto que não possui um "body" válido
    mse_inter_showMessage "mseTestArrShowMsg" "w" "default" "" ""
    echo "--- ${mseTestArrShowMsg[meta_type]} :: ${mseTestArrShowMsg[meta_format]} :: ${mseTestArrShowMsg[title_type]} ---"

    # Finalmente, mostra uma mensagem do tipo "title" com texto redefinido
    mse_inter_showMessage "mseTestArrShowMsg" "s" "title" "Tudo certo... prossiga" ""
    echo "---"

    # Mostra uma mensagem do tipo "title" com texto trazendo o código
    mse_inter_showMessage "mseTestArrShowMsg" "s" "title" "COD::Tudo certo... prossiga" ""
    echo "---"

    # Mostra uma mensagem do tipo "default" com título e body customizados
    mse_inter_showMessage "mseTestArrShowMsg" "s" "default" "UTEST::Meu título" "mseTestArrBody"
    echo "---"

    # Mostra uma mensagem do tipo "status" que, posteriormente será redefinida por uma outra com outro tipo
    # mostrando a possibilidade de alteração em uma mesma linha
    mse_inter_showMessage "mseTestArrShowMsg" "f" "status" "X::Tudo errado!" ""
    mse_inter_clearLine "" "1"
    mse_inter_showMessage "mseTestArrShowMsg" "s" "status" "X::Tudo certo!" ""
    printf "\n---"
  fi


  local mseTestShowAlertInShell="0"
  if [ "${mseTestShowAlertInShell}" == "1" ]; then
    echo "---"
    # Mostra uma mensagem do tipo "title"
    mse_inter_showAlert "i" "Mostra apenas título"
    echo "---"

    # Mostra uma mensagem do tipo "default" com um corpo
    mse_inter_showAlert "a" "Informando o Usuário" "mseTestArrBody"
    echo "---"

    # Mostra uma mensagem do tipo "default" com um corpo e título usando código
    mse_inter_showAlert "f" "S004::Informando o Usuário com código" "mseTestArrBody"
    echo "---"

    # Mostra uma mensagem de status
    mse_inter_showAlert "w" "Cuidado"
    echo "---"
  fi


  local mseTestShowErrorInShell="0"
  if [ "${mseTestShowErrorInShell}" == "1" ]; then
    # Mostra uma mensagem tendo apenas um título simples
    mse_inter_showError "Um erro ocorreu"
    echo "---"

    # Mostra uma mensagem tendo um título simples e um corpo
    mse_inter_showError "Um erro ocorreu" "mseTestArrBody"
    echo "---"

    # Mostra uma mensagem tendo um título com um código e um corpo
    mse_inter_showError "E006::Um erro ocorreu" "mseTestArrBody"
    echo "---"
  fi


  local mseTestShowStatusInShell="0"
  if [ "${mseTestShowStatusInShell}" == "1" ]; then
    echo "---"
    # Mostra uma mensagem tendo apenas um título simples
    mse_inter_showStatus "w" "Verificando o andamento do processo"
    sleep 1
    mse_inter_clearLine "" "1"

    mse_inter_showStatus "a" "O processo iniciou"
    sleep 1
    mse_inter_clearLine "" "1"

    mse_inter_showStatus "s" "O processo finalizou sem erros"
    printf "\n---\n"
  fi


  local mseTestShowPromptInShell="1"
  if [ "${mseTestShowPromptInShell}" == "1" ]; then
    echo "---"
    # Mostra um prompt booleano
    mse_inter_showPrompt "" "friendly" "Você é um usuário root?" "bool"

    echo "---"
    # Mostra um prompt de lista de valores
    unset mseTestPromptAssocValues
    declare -A mseTestPromptAssocValues
    mseTestPromptAssocValues["value01"]="1::01::v1::val1"
    mseTestPromptAssocValues["value02"]="2::02::v2::val2"
    mseTestPromptAssocValues["value03"]="3::03::v3::val3"
    mse_inter_showPrompt "" "ordinary" "Escolha um dos valores:" "list" "mseTestPromptAssocValues"


    echo "---"
    # Mostra um prompt de lista de valores grande cuja verificação será feita usando case insensitive
    unset mseTestPromptAssocValues
    declare -A mseTestPromptAssocValues
    mseTestPromptAssocValues["ac"]="Acre"
    mseTestPromptAssocValues["al"]="Alagoas"
    mseTestPromptAssocValues["ap"]="Amapá"
    mseTestPromptAssocValues["am"]="Amazonas"
    mseTestPromptAssocValues["ba"]="Bahia"
    mseTestPromptAssocValues["ce"]="Ceará"
    mseTestPromptAssocValues["df"]="Distrito Federal"
    mseTestPromptAssocValues["es"]="Espírito Santo"
    mseTestPromptAssocValues["go"]="Goiás"
    mseTestPromptAssocValues["ma"]="Maranhão"
    mseTestPromptAssocValues["mt"]="Mato Grosso"
    mseTestPromptAssocValues["ms"]="Mato Grosso do Sul"
    mseTestPromptAssocValues["mg"]="Minas Gerais"
    mseTestPromptAssocValues["pa"]="Pará"
    mseTestPromptAssocValues["pb"]="Paraíba"
    mseTestPromptAssocValues["pr"]="Paraná"
    mseTestPromptAssocValues["pe"]="Pernambuco"
    mseTestPromptAssocValues["pi"]="Piauí"
    mseTestPromptAssocValues["rj"]="Rio de Janeiro"
    mseTestPromptAssocValues["rn"]="Rio Grande do Norte"
    mseTestPromptAssocValues["rs"]="Rio Grande do Sul"
    mseTestPromptAssocValues["ro"]="Rondônia"
    mseTestPromptAssocValues["rr"]="Roraima"
    mseTestPromptAssocValues["sc"]="Santa Catarina"
    mseTestPromptAssocValues["sp"]="São Paulo"
    mseTestPromptAssocValues["se"]="Sergipe"
    mseTestPromptAssocValues["to"]="Tocantins"

    mse_inter_showPrompt "" "caution" "Indique o seu estado:" "list" "mseTestPromptAssocValues"
  fi


}
