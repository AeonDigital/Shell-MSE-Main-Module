#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Exibe uma versão resumida dos metadados referentes aos módulos e submódulos
# carregados. As funções não são mostradas.
# Ao lado de cada módulo e submódulo estará a quantidade total de funções que
# cada qual possui.
#
# Se desejar maiores detalhes ou executar uma busca por um módulo, submódulo
# ou função em especial, use a função "mse_mmod_showMetaData".
#
# @param bool $1
# Opcional.
# Omita ou indique "1" para uma saída estilizada.
# Indique "0" para que a saída seja uma lista simples.
#
# @return
# Uma lista contendo todas as informações requeridas formatadas conforme
# indicado. A lista será sempre ordenada alfabeticamente.
mse_mmod_showMetaSummary() {
  mse_mmod_loadLocaleLabels $(dirname "${BASH_SOURCE[0]}")

  local msePrettyFormat=1
  if [ "$1" == "0" ] || [ "$1" == "1" ]; then
    msePrettyFormat="$1"
  fi

  mse_mmod_showMetaData "${msePrettyFormat}" 0

  mse_inter_setCursorPosition top 1
  mse_inter_alertUser "i" "" "${lbl_showMetaSummary_moreDetails}"
}
MSE_GLOBAL_CMD["show metaSummary"]="mse_mmod_showMetaSummary"
