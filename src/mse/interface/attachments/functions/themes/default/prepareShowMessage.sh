#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# @desc
# Finishes preparing an associative array by applying the settings that are
# specific to this theme.
#
# @param string $1
# Name of the associative array that brings the settings for the presentation
# of the message.
# To initialize this associative array you can use the
# "mse_interface_prepare_message" function.
mse_inter_theme_default_prepareShowMessage() {
  mse_inter_theme_default_set_colors

  declare -n mseTmpArrThemePrepareMessage="${1}"
  local mseMessageType="${mseTmpArrThemePrepareMessage[meta_type]}"
  local msePrefix="${MSE_GLOBAL_MAIN_THEME_COLORS[${MSE_GLOBAL_THEME_NAME}]}"


  case "${mseTmpArrThemePrepareMessage[meta_format]}" in
    custom)
      mseTmpArrThemePrepareMessage["meta_format"]="custom"
    ;;

    default | prompt)
      mseTmpArrThemePrepareMessage["top_separator_string"]="\n"
      mseTmpArrThemePrepareMessage["top_separator_color"]=""
      mseTmpArrThemePrepareMessage["top_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["top_separator_colorize"]="0"



      mseTmpArrThemePrepareMessage["title_show"]="1"

      mseTmpArrThemePrepareMessage["title_top_separator_string"]=""
      mseTmpArrThemePrepareMessage["title_top_separator_color"]=""
      mseTmpArrThemePrepareMessage["title_top_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["title_top_separator_colorize"]="0"

      mseTmpArrThemePrepareMessage["title_indent"]="  "

      mseTmpArrThemePrepareMessage["title_bullet"]=":: "
      mseTmpArrThemePrepareMessage["title_bullet_color"]=""
      mseTmpArrThemePrepareMessage["title_bullet_color_alt"]=""
      mseTmpArrThemePrepareMessage["title_bullet_colorize"]="0"

      mseTmpArrThemePrepareMessage["title_string_color"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_message_title_string_${mseMessageType}]}"
      mseTmpArrThemePrepareMessage["title_string_color_alt"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_message_title_string_${mseMessageType}_alt]}"
      mseTmpArrThemePrepareMessage["title_string_colorize"]="1"
      mseTmpArrThemePrepareMessage["title_string_end"]="\n"

      mseTmpArrThemePrepareMessage["title_bottom_separator_string"]="\n"
      mseTmpArrThemePrepareMessage["title_bottom_separator_color"]=""
      mseTmpArrThemePrepareMessage["title_bottom_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["title_bottom_separator_colorize"]="0"



      mseTmpArrThemePrepareMessage["body_show"]="1"

      mseTmpArrThemePrepareMessage["body_top_separator_string"]=""
      mseTmpArrThemePrepareMessage["body_top_separator_color"]=""
      mseTmpArrThemePrepareMessage["body_top_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["body_top_separator_colorize"]="0"

      mseTmpArrThemePrepareMessage["body_first_line_indent"]="     "
      mseTmpArrThemePrepareMessage["body_first_line_bullet"]=""
      mseTmpArrThemePrepareMessage["body_first_line_bullet_color"]=""
      mseTmpArrThemePrepareMessage["body_first_line_bullet_color_alt"]=""
      mseTmpArrThemePrepareMessage["body_first_line_bullet_colorize"]="0"

      mseTmpArrThemePrepareMessage["body_lines_indent"]="     "

      mseTmpArrThemePrepareMessage["body_lines_bullet"]=""
      mseTmpArrThemePrepareMessage["body_lines_bullet_color"]=""
      mseTmpArrThemePrepareMessage["body_lines_bullet_color_alt"]=""
      mseTmpArrThemePrepareMessage["body_lines_bullet_colorize"]="0"

      mseTmpArrThemePrepareMessage["body_lines_color"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_message_body]}"
      mseTmpArrThemePrepareMessage["body_lines_color_alt"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_message_body_alt]}"
      mseTmpArrThemePrepareMessage["body_lines_colorize"]="1"

      mseTmpArrThemePrepareMessage["body_bottom_separator_string"]=""
      mseTmpArrThemePrepareMessage["body_bottom_separator_color"]=""
      mseTmpArrThemePrepareMessage["body_bottom_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["body_bottom_separator_colorize"]="0"



      mseTmpArrThemePrepareMessage["bottom_separator_string"]="\n"
      mseTmpArrThemePrepareMessage["bottom_separator_color"]=""
      mseTmpArrThemePrepareMessage["bottom_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["bottom_separator_colorize"]="0"


      if [ "${mseTmpArrThemePrepareMessage[meta_format]}" == "prompt" ]; then
        mseTmpArrThemePrepareMessage["title_bottom_separator_string"]=""
      fi
    ;;

    title)
      mseTmpArrThemePrepareMessage["top_separator_string"]=""
      mseTmpArrThemePrepareMessage["top_separator_color"]=""
      mseTmpArrThemePrepareMessage["top_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["top_separator_colorize"]="0"



      mseTmpArrThemePrepareMessage["title_show"]="1"

      mseTmpArrThemePrepareMessage["title_top_separator_string"]="\n"
      mseTmpArrThemePrepareMessage["title_top_separator_color"]=""
      mseTmpArrThemePrepareMessage["title_top_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["title_top_separator_colorize"]="0"

      mseTmpArrThemePrepareMessage["title_indent"]="  "

      mseTmpArrThemePrepareMessage["title_bullet"]=":: "
      mseTmpArrThemePrepareMessage["title_bullet_color"]=""
      mseTmpArrThemePrepareMessage["title_bullet_color_alt"]=""
      mseTmpArrThemePrepareMessage["title_bullet_colorize"]="0"

      mseTmpArrThemePrepareMessage["title_string_color"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_message_title_string_${mseMessageType}]}"
      mseTmpArrThemePrepareMessage["title_string_color_alt"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_message_title_string_${mseMessageType}_alt]}"
      mseTmpArrThemePrepareMessage["title_string_colorize"]="1"
      mseTmpArrThemePrepareMessage["title_string_end"]="\n"

      mseTmpArrThemePrepareMessage["title_bottom_separator_string"]="\n"
      mseTmpArrThemePrepareMessage["title_bottom_separator_color"]=""
      mseTmpArrThemePrepareMessage["title_bottom_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["title_bottom_separator_colorize"]="0"



      mseTmpArrThemePrepareMessage["body_show"]="0"



      mseTmpArrThemePrepareMessage["bottom_separator_string"]=""
      mseTmpArrThemePrepareMessage["bottom_separator_color"]=""
      mseTmpArrThemePrepareMessage["bottom_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["bottom_separator_colorize"]="0"
    ;;

    status)
      mseTmpArrThemePrepareMessage["top_separator_string"]=""
      mseTmpArrThemePrepareMessage["top_separator_color"]=""
      mseTmpArrThemePrepareMessage["top_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["top_separator_colorize"]="0"



      mseTmpArrThemePrepareMessage["title_show"]="1"

      mseTmpArrThemePrepareMessage["title_top_separator_string"]=""
      mseTmpArrThemePrepareMessage["title_top_separator_color"]=""
      mseTmpArrThemePrepareMessage["title_top_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["title_top_separator_colorize"]="0"

      mseTmpArrThemePrepareMessage["title_indent"]="  "

      mseTmpArrThemePrepareMessage["title_bullet"]=":: "
      mseTmpArrThemePrepareMessage["title_bullet_color"]=""
      mseTmpArrThemePrepareMessage["title_bullet_color_alt"]=""
      mseTmpArrThemePrepareMessage["title_bullet_colorize"]="0"

      mseTmpArrThemePrepareMessage["title_string_color"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_message_title_string_${mseMessageType}]}"
      mseTmpArrThemePrepareMessage["title_string_color_alt"]="${MSE_GLOBAL_MAIN_THEME_COLORS[${msePrefix}_message_title_string_${mseMessageType}_alt]}"
      mseTmpArrThemePrepareMessage["title_string_colorize"]="1"
      mseTmpArrThemePrepareMessage["title_string_end"]=""

      mseTmpArrThemePrepareMessage["title_bottom_separator_string"]=""
      mseTmpArrThemePrepareMessage["title_bottom_separator_color"]=""
      mseTmpArrThemePrepareMessage["title_bottom_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["title_bottom_separator_colorize"]="0"



      mseTmpArrThemePrepareMessage["body_show"]="0"



      mseTmpArrThemePrepareMessage["bottom_separator_string"]=""
      mseTmpArrThemePrepareMessage["bottom_separator_color"]=""
      mseTmpArrThemePrepareMessage["bottom_separator_color_alt"]=""
      mseTmpArrThemePrepareMessage["bottom_separator_colorize"]="0"
    ;;
  esac
}