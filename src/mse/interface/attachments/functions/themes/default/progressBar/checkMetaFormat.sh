#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Usado para barras de progresso.
# Valida o valor "meta_format" indicado. Sendo válido, retorna ele próprio.
# Sendo inválido, retorna o valor padrão.
#
# @param string $1
# Valor que está sendo testado
#
# @return
# Valor "meta_format" válido para este tema
mse_interface_theme_default_progressBar_checkMetaFormat() {
  declare -a mseAllowedMetaFormat=("custom" "default" "onlybar")

  local mseReturn="${1}"
  if [[ ! "${mseAllowedMetaFormat[*]}" =~ "${mseReturn}" ]]; then
    mseReturn="default"
  fi

  printf "${mseReturn}"
}