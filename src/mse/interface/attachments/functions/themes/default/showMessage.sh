#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# @desc
# Assembles and displays the message from the indicated settings.
#
# @param string $1
# Name of the associative array that brings the settings for the presentation
# of the message.
#
# @param string $2
# Optional.
# Name of an associative array bringing configurations not initially foreseen.
# Used to expand themes.
mse_inter_theme_default_showMessage() {
  declare -n mseTmpThemeArrShowMessage="${1}"


  if [ "${mseTmpThemeArrShowMessage[meta_format]}" == "default" ]; then
    local mseValidBody="1"

    if [ "${mseTmpThemeArrShowMessage[body_lines]}" == "" ]; then
      mseValidBody="0"
    else
      if [[ ! "$(declare -p ${mseTmpThemeArrShowMessage[body_lines]} 2> /dev/null)" =~ "declare -a" ]]; then
        mseValidBody="0"
      else
        declare -n mseTmpThemeBodyArrayName="${mseTmpThemeArrShowMessage["body_lines"]}"
        if [ "${#mseTmpThemeBodyArrayName[@]}" == "0" ]; then
          mseValidBody="0"
        fi
      fi
    fi


    if [ "${mseValidBody}" == "0" ]; then
      mseTmpThemeArrShowMessage[meta_format]="title"
      mse_inter_theme_default_prepareShowMessage "${1}"
    fi
  fi



  #
  # For this theme there are 2 title formats.
  # - simple
  #   The entire string that forms the title message is shown as it was originally defined.
  #
  # - code
  #   If there is the separator "::" will use the format "code" where, the first part should
  #   be some meta information of utility for the user to identify the nature of the message
  #   being shown.
  #
  mseTmpThemeArrShowMessage[title_type]="simple"
  if [[ "${mseTmpThemeArrShowMessage[title_string]}" == *"::"* ]]; then
    mseTmpThemeArrShowMessage[title_type]="code"
  fi



  mse_inter_theme_default_showMessage_createSeparator "${mseTmpThemeArrShowMessage[meta_type]}" "${mseTmpThemeArrShowMessage[top_separator_string]}" "${mseTmpThemeArrShowMessage[top_separator_color]}" "${mseTmpThemeArrShowMessage[top_separator_color_alt]}" "${mseTmpThemeArrShowMessage[top_separator_colorize]}"
  mse_inter_theme_default_showMessage_createTitle "${1}"

  if [ "${mseTmpThemeArrShowMessage[meta_format]}" == "prompt" ]; then
    mse_inter_theme_default_showMessage_createPromptBody "${1}" "${2}"
  fi

  mse_inter_theme_default_showMessage_createMessageBody "${1}"

  mse_inter_theme_default_showMessage_createSeparator "${mseTmpThemeArrShowMessage[meta_type]}" "${mseTmpThemeArrShowMessage[bottom_separator_string]}" "${mseTmpThemeArrShowMessage[bottom_separator_color]}" "${mseTmpThemeArrShowMessage[bottom_separator_color_alt]}" "${mseTmpThemeArrShowMessage[bottom_separator_colorize]}"
}