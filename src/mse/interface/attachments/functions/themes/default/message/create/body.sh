#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Assembles the entire part of the message body according to the settings defined and the theme used.
#
# @param string $1
# Name of the associative array that brings the settings for the presentation of the message.
#
# @return
# Prints the result according to the settings passed.
mse_interface_theme_default_message_create_body() {
  declare -n mseTmpThemeArrCreateBody="${1}"

  if [ "${mseTmpThemeArrCreateBody[body_show]}" == "1" ]; then
    local mseMessageType="${mseTmpThemeArrCreateBody[meta_type]}"

    local mseBodyTopSeparatorString="${mseTmpThemeArrCreateBody[body_top_separator_string]}"
    local mseBodyTopSeparatorColor="${mseTmpThemeArrCreateBody[body_top_separator_color]}"
    local mseBodyTopSeparatorColorAlt="${mseTmpThemeArrCreateBody[body_top_separator_color_alt]}"
    local mseBodyTopSeparatorColorize="${mseTmpThemeArrCreateBody[body_top_separator_colorize]}"

    local mseBodyFirstLineIndent="${mseTmpThemeArrCreateBody[body_first_line_indent]}"

    local mseBodyFirstLineBullet="${mseTmpThemeArrCreateBody[body_first_line_bullet]}"
    local mseBodyFirstLineBulletColor="${mseTmpThemeArrCreateBody[body_first_line_bullet_color]}"
    local mseBodyFirstLineBulletColorAlt="${mseTmpThemeArrCreateBody[body_first_line_bullet_color_alt]}"
    local mseBodyFirstLineBulletColorize="${mseTmpThemeArrCreateBody[body_first_line_bullet_colorize]}"

    local mseBodyLinesIndent="${mseTmpThemeArrCreateBody[body_lines_indent]}"

    local mseBodyLinesBullet="${mseTmpThemeArrCreateBody[body_lines_bullet]}"
    local mseBodyLinesBulletColor="${mseTmpThemeArrCreateBody[body_lines_bullet_color]}"
    local mseBodyLinesBulletColorAlt="${mseTmpThemeArrCreateBody[body_lines_bullet_color_alt]}"
    local mseBodyLinesBulletColorize="${mseTmpThemeArrCreateBody[body_lines_bullet_colorize]}"

    if [ "${mseTmpThemeArrCreateBody[body_lines]}" == "" ]; then
      declare -a mseBodyLines=()
    else
      declare -n mseBodyLines="${mseTmpThemeArrCreateBody[body_lines]}"
    fi
    local mseBodyLinesColor="${mseTmpThemeArrCreateBody[body_lines_color]}"
    local mseBodyLinesColorAlt="${mseTmpThemeArrCreateBody[body_lines_color_alt]}"
    local mseBodyLinesColorize="${mseTmpThemeArrCreateBody[body_lines_colorize]}"

    local mseBodyBottomSeparatorString="${mseTmpThemeArrCreateBody[body_bottom_separator_string]}"
    local mseBodyBottomSeparatorColor="${mseTmpThemeArrCreateBody[body_bottom_separator_color]}"
    local mseBodyBottomSeparatorColorAlt="${mseTmpThemeArrCreateBody[body_bottom_separator_color_alt]}"
    local mseBodyBottomSeparatorColorize="${mseTmpThemeArrCreateBody[body_bottom_separator_colorize]}"






    local mseLineText=""
    local mseCountLines=0

    local mseLineIndent
    local mseLineBullet
    local mseLineBulletColor
    local mseLineBulletColorAlt
    local mseLineBulletColorize

    local mseUseBody

    for mseLineText in "${mseBodyLines[@]}"; do
      ((mseCountLines=mseCountLines+1))

      if [ "${mseCountLines}" == "1" ]; then
        mseLineIndent="${mseBodyFirstLineIndent}"
        mseLineBullet="${mseBodyFirstLineBullet}"
        mseLineBulletColor="${mseBodyFirstLineBulletColor}"
        mseLineBulletColorAlt="${mseBodyFirstLineBulletColorAlt}"
        mseLineBulletColorize="${mseBodyFirstLineBulletColorize}"
      else
        mseLineIndent="${mseBodyLinesIndent}"
        mseLineBullet="${mseBodyLinesBullet}"
        mseLineBulletColor="${mseBodyLinesBulletColor}"
        mseLineBulletColorAlt="${mseBodyLinesBulletColorAlt}"
        mseLineBulletColorize="${mseBodyLinesBulletColorize}"
      fi


      mseUseBody+="${mseLineIndent}"
      mseUseBody+=$(mse_interface_theme_default_message_create_bullet "${mseMessageType}" "${mseLineBullet}" "${mseLineBulletColor}" "${mseLineBulletColorAlt}" "${mseLineBulletColorize}")

      if [ "${mseBodyLinesColorize}" == "1" ]; then
        mseUseBody+="${mseBodyLinesColor}"
      fi
      mseUseBody+="${mseLineText}"
      if [ "${mseBodyLinesColorize}" == "1" ]; then
        mseUseBody+="${mseNONE}"
      fi

      mseUseBody+="\n"
    done


    mse_interface_theme_default_message_create_separator "${mseMessageType}" "${mseBodyTopSeparatorString}" "${mseBodyTopSeparatorColor}" "${mseBodyTopSeparatorColorAlt}" "${mseBodyTopSeparatorColorize}"
    printf "${mseUseBody}"
    mse_interface_theme_default_message_create_separator "${mseMessageType}" "${mseBodyBottomSeparatorString}" "${mseBodyBottomSeparatorColor}" "${mseBodyBottomSeparatorColorAlt}" "${mseBodyBottomSeparatorColorize}"
  fi
}