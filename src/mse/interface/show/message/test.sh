#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_interface_show_message() {
  testResult="-"
  testExpected="-"

  mse_md_utest_assertEqual



  unset mseTestArrBody
  declare -a mseTestArrBody
  mseTestArrBody+=("Primeira linha de informação")
  mseTestArrBody+=("Segunda linha")
  mseTestArrBody+=("Terceira linha")


  local mseTestShowMessageInShell="1"
  if [ "${mseTestShowMessageInShell}" == "1" ]; then

    echo "---"
    # Mensagem sem nada... apenas atesta que usará o formato "title"
    mse_interface_show_message
    echo "--- ${MSE_MESSAGE_THEME_CONFIG[meta_type]} :: ${MSE_MESSAGE_THEME_CONFIG[meta_format]} :: ${MSE_MESSAGE_THEME_CONFIG[title_type]} ---"

    # Mensagem do tipo "attention"... atesta o título padrão e a coloração
    mse_interface_show_message "mseTestArrShowMsg" "a"
    echo "--- ${mseTestArrShowMsg[meta_type]} :: ${mseTestArrShowMsg[meta_format]} :: ${mseTestArrShowMsg[title_type]} ---"

    # Confirma que mesmo forçando o formato "default" irá mostrar um "title" visto que não possui um "body" válido
    mse_interface_show_message "mseTestArrShowMsg" "w" "default" "" ""
    echo "--- ${mseTestArrShowMsg[meta_type]} :: ${mseTestArrShowMsg[meta_format]} :: ${mseTestArrShowMsg[title_type]} ---"

    # Finalmente, mostra uma mensagem do tipo "title" com texto redefinido
    mse_interface_show_message "mseTestArrShowMsg" "s" "title" "Tudo certo... prossiga" ""
    echo "---"

    # Mostra uma mensagem do tipo "title" com texto trazendo o código
    mse_interface_show_message "mseTestArrShowMsg" "s" "title" "COD::Tudo certo... prossiga" ""
    echo "---"

    # Mostra uma mensagem do tipo "default" com título e body customizados
    mse_interface_show_message "mseTestArrShowMsg" "s" "default" "UTEST::Meu título" "mseTestArrBody"
    echo "---"

    # Mostra uma mensagem do tipo "status" que, posteriormente será redefinida por uma outra com outro tipo
    # mostrando a possibilidade de alteração em uma mesma linha
    mse_interface_show_message "mseTestArrShowMsg" "f" "status" "X::Tudo errado!" ""
    sleep 1
    mse_interface_clear_line "" "1"
    mse_interface_show_message "mseTestArrShowMsg" "s" "status" "X::Tudo certo!" ""
    printf "\n---"
  fi





  local mseTestShowAlertInShell="1"
  if [ "${mseTestShowAlertInShell}" == "1" ]; then
    echo "---"
    # Mostra uma mensagem do tipo "title"
    mse_interface_show_alert "i" "Mostra apenas título"
    echo "---"

    # Mostra uma mensagem do tipo "default" com um corpo
    mse_interface_show_alert "a" "Informando o Usuário" "mseTestArrBody"
    echo "---"

    # Mostra uma mensagem do tipo "default" com um corpo e título usando código
    mse_interface_show_alert "f" "S004::Informando o Usuário com código" "mseTestArrBody"
    echo "---"

    # Mostra uma mensagem de status
    mse_interface_show_alert "w" "Cuidado"
    echo "---"
  fi





  local mseTestShowErrorInShell="1"
  if [ "${mseTestShowErrorInShell}" == "1" ]; then
    # Mostra uma mensagem tendo apenas um título simples
    mse_interface_show_error "Um erro ocorreu"
    echo "---"

    # Mostra uma mensagem tendo um título simples e um corpo
    mse_interface_show_error "Um erro ocorreu" "mseTestArrBody"
    echo "---"

    # Mostra uma mensagem tendo um título com um código e um corpo
    mse_interface_show_error "E006::Um erro ocorreu" "mseTestArrBody"
    echo "---"
  fi





  local mseTestShowStatusInShell="1"
  if [ "${mseTestShowStatusInShell}" == "1" ]; then
    echo "---"
    # Mostra uma mensagem tendo apenas um título simples
    mse_interface_show_status "w" "Verificando o andamento do processo"
    sleep 1
    mse_interface_clear_line "" "1"

    mse_interface_show_status "a" "O processo iniciou"
    sleep 1
    mse_interface_clear_line "" "1"

    mse_interface_show_status "s" "O processo finalizou sem erros"
    printf "\n---\n"
  fi


  local mseTestShowPromptInShell="0"
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