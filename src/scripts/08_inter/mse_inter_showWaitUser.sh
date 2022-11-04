#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem para o usuário e interrompe a execução do script até
# que ele digite uma tecla qualquer.
#
# @param string $1
# Tipo de mensagem.
#
# [[ Mensagens de Alerta ]]
#
#   - ""        | ""  : Não definido (valor padrão).
#   - none      | n   : Não definido (mesmo que acima).
#   - info      | i   : Informação genérica.
#   - attention | a   : Atenção.
#   - warning   | w   : Alerta.
#   - error     | e   : Erro em uma operação.
#   - fail      | f   : Falha em uma operação.
#   - success   | s   : Sucesso em uma operação.
#
#
# @param string $2
# Opcional (para o tema padrão)
# Título da mensagem.
#
# @return
# Printa na tela as informações desejadas conforme configuração passada.
mse_inter_showWaitUser() {
  local mseWaitingTitle="${2}"
  if [ "${mseWaitingTitle}" == "" ]; then
    mseWaitingTitle="${lbl_inter_wait_user_any_key}"
  fi

  local mseWaitingMessage
  mseWaitingMessage=$(mse_inter_showMessage "MSE_GLOBAL_SHOW_MESSAGE_CONFIG" "${1}" "title" "${mseWaitingTitle}")
  read -n 1 -s -r -p "${mseWaitingMessage}  "
  printf "\n"
}
