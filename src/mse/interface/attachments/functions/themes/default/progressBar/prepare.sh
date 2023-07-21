#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Finishes preparing an associative array by applying the settings that are
# specific to this theme.
#
# @param string $1
# Name of the associative array that brings the settings to the progress bar
# presentation.
#
# To configure this associative array, use the
# "mse_prepare_interface_progressBar" function.
mse_interface_theme_default_progressBar_prepare() {
  mse_interface_theme_default_set_colors

  declare -n mseTmpArrThemePrepareProgressBar="${1}"
  local msePrefix="${MSE_MESSAGE_THEME_COLORS[${MSE_MESSAGE_THEME_NAME}]}"



  case "${mseTmpArrThemePrepareProgressBar[meta_format]}" in
    custom)
      mseTmpArrThemePrepareProgressBar["meta_format"]="custom"
    ;;

    default)
      mseTmpArrThemePrepareProgressBar["meta_indent"]="  "


      mseTmpArrThemePrepareProgressBar["bar_ini_string"]="[ "
      mseTmpArrThemePrepareProgressBar["bar_end_string"]=" ] "

      mseTmpArrThemePrepareProgressBar["bar_fill_char"]="#"
      mseTmpArrThemePrepareProgressBar["bar_atual_progress"]="0"

      mseTmpArrThemePrepareProgressBar["bar_atual_bar_length"]="0"

      mseTmpArrThemePrepareProgressBar["bar_color"]="${MSE_MESSAGE_THEME_COLORS[${msePrefix}_progressbar_bar]}"
      mseTmpArrThemePrepareProgressBar["bar_color_alt"]="${MSE_MESSAGE_THEME_COLORS[${msePrefix}_progressbar_bar_alt]}"
      mseTmpArrThemePrepareProgressBar["bar_colorize"]="1"



      mseTmpArrThemePrepareProgressBar["info_show"]="1"

      mseTmpArrThemePrepareProgressBar["info_ini_string"]="( "
      mseTmpArrThemePrepareProgressBar["info_end_string"]=" )"

      mseTmpArrThemePrepareProgressBar["info_use_percent"]="1"

      mseTmpArrThemePrepareProgressBar["info_color"]="${MSE_MESSAGE_THEME_COLORS[${msePrefix}_progressbar_info]}"
      mseTmpArrThemePrepareProgressBar["info_color_alt"]="${MSE_MESSAGE_THEME_COLORS[${msePrefix}_progressbar_info_alt]}"
      mseTmpArrThemePrepareProgressBar["info_colorize"]="1"
    ;;

    onlybar)
      mseTmpArrThemePrepareProgressBar["meta_indent"]="  "


      mseTmpArrThemePrepareProgressBar["bar_ini_string"]="[ "
      mseTmpArrThemePrepareProgressBar["bar_end_string"]=" ] "

      mseTmpArrThemePrepareProgressBar["bar_fill_char"]="#"
      mseTmpArrThemePrepareProgressBar["bar_atual_progress"]="0"

      mseTmpArrThemePrepareProgressBar["bar_atual_bar_length"]="0"

      mseTmpArrThemePrepareProgressBar["bar_color"]="${MSE_MESSAGE_THEME_COLORS[${msePrefix}_progressbar_bar]}"
      mseTmpArrThemePrepareProgressBar["bar_color_alt"]="${MSE_MESSAGE_THEME_COLORS[${msePrefix}_progressbar_bar_alt]}"
      mseTmpArrThemePrepareProgressBar["bar_colorize"]="1"


      mseTmpArrThemePrepareProgressBar["info_show"]="0"
    ;;
  esac
}