#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Usado para mensagens.
# Valida o valor "meta_format" indicado. Sendo válido, retorna ele próprio.
# Sendo inválido, retorna o valor padrão.
#
# @param string $1
# Valor que está sendo testado
#
# @return
# Valor "meta_format" válido para este tema
mse_interface_theme_default_message_check_format() {
  declare -a mseAllowedMetaFormat=("custom" "default" "prompt" "status" "title")

  local mseReturn="${1}"
  if [[ ! "${mseAllowedMetaFormat[*]}" =~ "${mseReturn}" ]]; then
    mseReturn="default"
  fi

  printf "${mseReturn}"
}