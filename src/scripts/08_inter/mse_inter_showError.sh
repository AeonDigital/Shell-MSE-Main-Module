#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem de erro para o usuário usando o tema que está
# atualmente configurado na variável "MSE_GLOBAL_THEME_NAME".
#
#
# @param string $1
# Opcional (para o tema padrão)
# Título da mensagem.
#
#
# @param string $2
# Opcional (para o tema padrão)
# Nome de um array unidimensional em que estão as linhas da mensagem.
#
#
# @return
# Printa na tela a mensagem indicada conforme configuração passada.
mse_inter_showError() {
  mse_inter_showMessage "MSE_GLOBAL_SHOW_MESSAGE_CONFIG" "error" "default" "${1}" "${2}"
}
