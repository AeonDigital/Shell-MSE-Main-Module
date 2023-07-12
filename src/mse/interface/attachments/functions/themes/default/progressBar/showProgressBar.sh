#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Efetivamente monta e mostra a barra de progresso a partir das configurações
# indicadas.
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# barra de progresso.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_interface_theme_default_showProgressBar() {
  declare -n mseTmpThemeArrShowProgressBar="${1}"


  local mseProgressBarComponent=$(mse_interface_theme_default_showProgressBar_createBar "${1}")
  local mseInformationComponent=$(mse_interface_theme_default_showProgressBar_createInformation "${1}")

  mse_interface_clear_line

  if [ "${mseTmpThemeArrShowProgressBar[info_align]}" == "left" ]; then
    printf "%s" "${mseInformationComponent}"
  fi

  printf "%s" "${mseTmpThemeArrShowProgressBar[meta_indent]}"
  printf "%s" "${mseProgressBarComponent}"

  if [ "${mseTmpThemeArrShowProgressBar[info_align]}" == "right" ]; then
    printf "%s" "${mseInformationComponent}"
  fi


  if [ "${mseTmpThemeArrShowProgressBar[bar_atual_progress]}" == "100" ]; then
    printf "\n"
  else
    printf "\r"
  fi
}