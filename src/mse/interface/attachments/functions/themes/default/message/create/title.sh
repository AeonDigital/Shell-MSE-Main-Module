#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Assembles the entire part of the message title according to the settings
# defined and the color theme used.
#
# @param string $1
# Name of the associative array that brings the settings for the presentation
# of the message.
#
# @return
# Prints the result according to the settings passed.
mse_interface_theme_default_message_create_title() {
  declare -n mseTmpThemeArrCreateTitle="${1}"

  if [ "${mseTmpThemeArrCreateTitle[title_show]}" == "1" ]; then
    local mseMessageType="${mseTmpThemeArrCreateTitle[meta_type]}"

    local mseTitleType="${mseTmpThemeArrCreateTitle[title_type]}"

    local mseTitleTopSeparatorString="${mseTmpThemeArrCreateTitle[title_top_separator_string]}"
    local mseTitleTopSeparatorColor="${mseTmpThemeArrCreateTitle[title_top_separator_color]}"
    local mseTitleTopSeparatorColorAlt="${mseTmpThemeArrCreateTitle[title_top_separator_color_alt]}"
    local mseTitleTopSeparatorColorize="${mseTmpThemeArrCreateTitle[title_top_separator_colorize]}"

    local mseTitleIndent="${mseTmpThemeArrCreateTitle[title_indent]}"

    local mseTitleBullet="${mseTmpThemeArrCreateTitle[title_bullet]}"
    local mseTitleBulletColor="${mseTmpThemeArrCreateTitle[title_bullet_color]}"
    local mseTitleBulletColorAlt="${mseTmpThemeArrCreateTitle[title_bullet_color_alt]}"
    local mseTitleBulletColorize="${mseTmpThemeArrCreateTitle[title_bullet_colorize]}"

    local mseTitleString="${mseTmpThemeArrCreateTitle[title_string]}"
    local mseTitleStringColor="${mseTmpThemeArrCreateTitle[title_string_color]}"
    local mseTitleStringColorAlt="${mseTmpThemeArrCreateTitle[title_string_color_alt]}"
    local mseTitleStringColorize="${mseTmpThemeArrCreateTitle[title_string_colorize]}"
    local mseTitleStringEnd="${mseTmpThemeArrCreateTitle[title_string_end]}"

    local mseTitleBottomSeparatorString="${mseTmpThemeArrCreateTitle[title_bottom_separator_string]}"
    local mseTitleBottomSeparatorColor="${mseTmpThemeArrCreateTitle[title_bottom_separator_color]}"
    local mseTitleBottomSeparatorColorAlt="${mseTmpThemeArrCreateTitle[title_bottom_separator_color_alt]}"
    local mseTitleBottomSeparatorColorize="${mseTmpThemeArrCreateTitle[title_bottom_separator_colorize]}"



    if [ "${mseTitleString}" == "" ]; then
      case "${mseMessageType}" in
        i)
          mseTitleString="${lbl_interface_show_message_header_info}"
        ;;
        a)
          mseTitleString="${lbl_interface_show_message_header_attention}"
        ;;
        w)
          mseTitleString="${lbl_interface_show_message_header_warning}"
        ;;
        e)
          mseTitleString="${lbl_interface_show_message_header_error}"
        ;;
        f)
          mseTitleString="${lbl_interface_show_message_header_fail}"
        ;;
        s)
          mseTitleString="${lbl_interface_show_message_header_success}"
        ;;
        fr | or | ca | im)
          mseTitleString=""
        ;;
      esac
    fi





    local mseUseTitle=""
    local mseUseTitleColor=""
    local mseUseTitleColorAlt=""
    declare -a mseTitleTextParts=()



    if [ "${mseTitleStringColorize}" == "1" ]; then
      mseUseTitleColor="${mseTitleStringColor}"
      mseUseTitleColorAlt="${mseTitleStringColorAlt}"
    fi



    case "${mseTitleType}" in
      simple)
        mseUseTitle="${mseUseTitleColor}${mseTitleString}${mseNONE}"
      ;;

      code)
        mse_str_split "::" "${mseTitleString}"
        mseTitleTextParts="${#MSE_LAST_FUNCTION_RETURN[@]}"

        if [ "${mseTitleTextParts}" -le "1" ]; then
          mseUseTitle="[ ${mseUseTitleColorAlt}script${mseNONE} ] ${mseUseTitleColor}${mseTitleString}${mseNONE}"
        else
          mseUseTitle="[ ${mseUseTitleColorAlt}${MSE_LAST_FUNCTION_RETURN[0]}${mseNONE} ] ${mseUseTitleColor}${MSE_LAST_FUNCTION_RETURN[@]:1}${mseNONE}"
        fi
      ;;
    esac



    mse_interface_theme_default_message_create_separator "${mseMessageType}" "${mseTitleTopSeparatorString}" "${mseTitleTopSeparatorColor}" "${mseTitleTopSeparatorColorAlt}" "${mseTitleTopSeparatorColorize}"
    printf "${mseTitleIndent}"
    mse_interface_theme_default_message_create_bullet "${mseMessageType}" "${mseTitleBullet}" "${mseTitleBulletColor}" "${mseTitleBulletColorAlt}" "${mseTitleBulletColorize}"
    printf "${mseUseTitle}${mseTitleStringEnd}"
    mse_interface_theme_default_message_create_separator "${mseMessageType}" "${mseTitleBottomSeparatorString}" "${mseTitleBottomSeparatorColor}" "${mseTitleBottomSeparatorColorAlt}" "${mseTitleBottomSeparatorColorize}"
  fi
}