#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Monta um bullet conforme as informações passadas.
#
# @param string $1
# Tipo de mensagem.
#
# @param string $2
# String a ser usada.
#
# @param string $3
# Código da cor a ser usada.
#
# @param string $4
# Código da cor alternativa a ser usada.
#
# @param bool $5
# Indica se deve usar a colorização indicada.
# Use "0" para não.
# Use "1" para sim.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_inter_theme_default_showMessage_createBullet() {
  mse_inter_theme_default_showMessage_createSeparator "${1}" "${2}" "${3}" "${4}" "${5}"
}