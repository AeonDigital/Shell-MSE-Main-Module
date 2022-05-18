#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem para o usuário e interrompe a execução do script até
# que ele digite uma tecla qualquer.
#
# @param string $1
# Mensagem que indica para o usuário o motivo de estar aguardando.
#
# @param string $2
# Opcional.
# Nome da função/tema usada para renderizar as mensagens a serem mostradas
# na tela. Se nenhuma for indicada, usará o tema padrão definido na
# variável global 'MSE_GLOBAL_THEME_FUNCTION'
#
# @return
# Printa na tela as informações desejadas conforme configuração passada.
mse_inter_waitUser() {
  local mseTheme="${MSE_GLOBAL_THEME_FUNCTION}"
  local mseTitle="${lbl_inter_wait_user_any_key}"


  if [ "$#" -ge 1 ]; then
    mseTitle="$1"
  fi

  if [ "$#" -ge 2 ]; then
    mseTheme="$2"
  fi

  local mseWaitingMessage
  mseWaitingMessage=$(mse_inter_showMessage "i" "CHECK" "" "3" "" "" "" "" "" "!::${mseTitle}" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "${mseTheme}")
  read -n 1 -s -r -p "${mseWaitingMessage}  "
  printf "\n"
}
