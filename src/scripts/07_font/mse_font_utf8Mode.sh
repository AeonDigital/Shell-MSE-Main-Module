#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Identifica/Ativa/Desativa o modo UTF-8 do terminal 'bash'.
#
# @param string $1
# Se for omitido, ou, se 'check' irá tentar desenhar na tela o caracter unicode
# 'cavalo branco' do xadres "♘".
# A conferência deve ser feita visualmente pelo operador humano.
#
# Indique 'on' para ativar ou 'off' para desativar o UTF-8 do seu terminal.
#
# @example
#   mse_font_setUTF8Mode check
#   mse_font_setUTF8Mode on
#   mse_font_setUTF8Mode off
mse_font_setUTF8Mode() {
  local mseReturn=""

  local mseMode="check"
  if [ $# -ge 1 ] && ([ "${1,,}" == "on" ] || [ "${1,,}" == "off" ]); then
    mseMode="${1,,}"
  fi

  case "${mseMode}" in
    on)
      printf "\033%%G"
    ;;
    off)
      printf "\033%%@"
    ;;
  esac

  printf "UTF-8: ${mseMode} \u2658 \n"
}
MSE_GLOBAL_CMD["set UTF8Mode"]="mse_font_setUTF8Mode"
