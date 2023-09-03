#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Assembles and displays the progress bar from the indicated settings.
#
# @param string $1
# Name of the associative array that brings the settings for the presentation
# of the progress bar.
mse_interface_theme_default_progressBar_show() {
  declare -n mseTmpThemeArrShowProgressBar="${1}"


  local mseProgressBarComponent=$(mse_interface_theme_default_progressBar_create_bar "${1}")
  local mseInformationComponent=$(mse_interface_theme_default_progressBar_create_information "${1}")

  mse_interface_clear_line

  if [ "${mseTmpThemeArrShowProgressBar[info_align]}" == "l" ]; then
    printf "%s" "${mseInformationComponent}"
  fi

  printf "%s" "${mseTmpThemeArrShowProgressBar[meta_indent]}"
  printf "%s" "${mseProgressBarComponent}"

  if [ "${mseTmpThemeArrShowProgressBar[info_align]}" == "r" ]; then
    printf "%s" "${mseInformationComponent}"
  fi


  if [ "${mseTmpThemeArrShowProgressBar[bar_atual_progress]}" == "100" ]; then
    printf "\n"
  else
    printf "\r"
  fi
}