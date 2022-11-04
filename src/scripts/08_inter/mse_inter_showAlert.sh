#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem de alerta para o usuário usando o tema que está
# atualmente configurado na variável "MSE_GLOBAL_THEME_NAME".
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
#
# @param string $3
# Opcional (para o tema padrão)
# Nome de um array unidimensional em que estão as linhas da mensagem.
#
#
# @return
# Printa na tela a mensagem indicada conforme configuração passada.
mse_inter_showAlert() {
  mse_inter_showMessage "MSE_GLOBAL_SHOW_MESSAGE_CONFIG" "${1}" "default" "${2}" "${3}"
}
