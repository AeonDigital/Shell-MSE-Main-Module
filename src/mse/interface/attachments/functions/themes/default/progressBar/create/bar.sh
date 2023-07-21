#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Assembles the "progress bar" component according to the configured settings.
#
# @param string $1
# Name of the associative array that brings the settings for the presentation
# of the progress bar.
#
# @return
# Prints the result according to the settings passed.
mse_interface_theme_default_progressBar_create_bar() {
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



  local mseBarAtualBarLength=0
  ((mseBarAtualBarLength = (mseBarMaxCharLength * mseBarAtualProgress) / 100))
  mseTmpThemeArrProgressBar["bar_atual_bar_length"]="${mseBarAtualBarLength}"


  local mseUseColor=""
  if [ "${mseBarColorize}" == "1" ]; then
    mseUseColor="${mseBarColor}"
  fi




  printf "%s" "${mseBarIniString}";

  for ((i=0; i<mseBarMaxCharLength; i++)); do
    if [ "${i}" -le "${mseBarAtualBarLength}" ]; then
      mseStrBar+="${mseBarFillChar}"
    else
      mseStrBar+=" "
    fi
  done

  printf "${mseUseColor}"; printf "%s" "${mseStrBar}"; printf "${mseNONE}"
  printf "%s" "${mseBarEndString}";
}