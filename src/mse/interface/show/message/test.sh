#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_interface_show_message() {
  testResult="-"
  testExpected="-"

  mse_utest_assert_equals



  unset mseTestArrBody
  declare -a mseTestArrBody
  mseTestArrBody+=("Primeira linha de informação")
  mseTestArrBody+=("Segunda linha")
  mseTestArrBody+=("Terceira linha")


  local mseTestShowMessageInShell="0"
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
    echo -ne "\n---"
  fi





  local mseTestShowAlertInShell="0"
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





  local mseTestShowErrorInShell="0"
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





  local mseTestShowStatusInShell="0"
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
    echo -ne "\n---\n"
  fi
}