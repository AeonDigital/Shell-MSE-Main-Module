#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
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
mse_interface_theme_default_message_show() {
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
      mse_interface_theme_default_message_prepare "${1}"
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



  mse_interface_theme_default_message_create_separator "${mseTmpThemeArrShowMessage[meta_type]}" "${mseTmpThemeArrShowMessage[top_separator_string]}" "${mseTmpThemeArrShowMessage[top_separator_color]}" "${mseTmpThemeArrShowMessage[top_separator_color_alt]}" "${mseTmpThemeArrShowMessage[top_separator_colorize]}"
  mse_interface_theme_default_message_create_title "${1}"

  if [ "${mseTmpThemeArrShowMessage[meta_format]}" == "prompt" ]; then
    mse_interface_theme_default_message_create_prompt "${1}" "${2}"
  fi

  mse_interface_theme_default_message_create_body "${1}"

  mse_interface_theme_default_message_create_separator "${mseTmpThemeArrShowMessage[meta_type]}" "${mseTmpThemeArrShowMessage[bottom_separator_string]}" "${mseTmpThemeArrShowMessage[bottom_separator_color]}" "${mseTmpThemeArrShowMessage[bottom_separator_color_alt]}" "${mseTmpThemeArrShowMessage[bottom_separator_colorize]}"
}