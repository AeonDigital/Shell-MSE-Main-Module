#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Monta o componente "barra de progresso" conforme as configurações definidas.
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# barra de progresso.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_inter_theme_default_showProgressBar_createBar() {
  declare -n mseTmpThemeArrProgressBar="${1}"

  local mseBarIniString="${mseTmpThemeArrProgressBar[bar_ini_string]}"
  local mseBarEndString="${mseTmpThemeArrProgressBar[bar_end_string]}"

  local mseBarFillChar="${mseTmpThemeArrProgressBar[bar_fill_char]}"
  local mseBarMaxCharLength="${mseTmpThemeArrProgressBar[bar_max_char_length]}"
  local mseBarAtualProgress="${mseTmpThemeArrProgressBar[bar_atual_progress]}"
  local mseBarAtualBarLength="${mseTmpThemeArrProgressBar[bar_atual_bar_length]}"

  local mseBarColor="${mseTmpThemeArrProgressBar[bar_color]}"
  local mseBarColorAlt="${mseTmpThemeArrProgressBar[bar_color_alt]}"
  local mseBarColorize="${mseTmpThemeArrProgressBar[bar_colorize]}"


  #
  # Calcula o tamanho total que a barra deve ter para representar o
  # progresso atualmente definido...
  local mseBarAtualBarLength=0
  ((mseBarAtualBarLength = (mseBarMaxCharLength * mseBarAtualProgress) / 100))
  mseTmpThemeArrProgressBar["bar_atual_bar_length"]="${mseBarAtualBarLength}"


  local mseUseColor=""
  if [ "${mseBarColorize}" == "1" ]; then
    mseUseColor="${mseBarColor}"
  fi



  #
  # Printa o início do delimitador
  printf "%s" "${mseBarIniString}";

  for ((i=0; i<mseBarMaxCharLength; i++)); do
    if [ "${i}" -le "${mseBarAtualBarLength}" ]; then
      mseStrBar+="${mseBarFillChar}"
    else
      mseStrBar+=" "
    fi
  done

  printf "${mseUseColor}"; printf "%s" "${mseStrBar}"; printf "${mseNONE}"

  #
  # Printa o fim do delimitador
  printf "%s" "${mseBarEndString}";
}