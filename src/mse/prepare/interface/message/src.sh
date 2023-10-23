#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_prepare_interface_message() {
  declare -n mseTmpArrPrepareMessage="${1}"


  local mseKey=""
  for mseKey in "${!mseTmpArrPrepareMessage[@]}"; do
    unset mseTmpArrPrepareMessage["${mseKey}"]
  done


  mseTmpArrPrepareMessage["meta_type"]="${2}"
  mseTmpArrPrepareMessage["meta_theme"]="${3}"
  mseTmpArrPrepareMessage["meta_format"]="${4}"


  mseTmpArrPrepareMessage["top_separator_string"]="${5}"
  mseTmpArrPrepareMessage["top_separator_color"]="${6}"
  mseTmpArrPrepareMessage["top_separator_color_alt"]="${7}"
  mseTmpArrPrepareMessage["top_separator_colorize"]="${8}"


  mseTmpArrPrepareMessage["title_show"]="${9}"
  mseTmpArrPrepareMessage["title_type"]="${10}"

  mseTmpArrPrepareMessage["title_top_separator_string"]="${11}"
  mseTmpArrPrepareMessage["title_top_separator_color"]="${12}"
  mseTmpArrPrepareMessage["title_top_separator_color_alt"]="${13}"
  mseTmpArrPrepareMessage["title_top_separator_colorize"]="${14}"

  mseTmpArrPrepareMessage["title_indent"]="${15}"

  mseTmpArrPrepareMessage["title_bullet"]="${16}"
  mseTmpArrPrepareMessage["title_bullet_color"]="${17}"
  mseTmpArrPrepareMessage["title_bullet_color_alt"]="${18}"
  mseTmpArrPrepareMessage["title_bullet_colorize"]="${19}"

  mseTmpArrPrepareMessage["title_string"]="${20}"
  mseTmpArrPrepareMessage["title_string_color"]="${21}"
  mseTmpArrPrepareMessage["title_string_color_alt"]="${22}"
  mseTmpArrPrepareMessage["title_string_colorize"]="${23}"
  mseTmpArrPrepareMessage["title_string_end"]="${24}"

  mseTmpArrPrepareMessage["title_bottom_separator_string"]="${25}"
  mseTmpArrPrepareMessage["title_bottom_separator_color"]="${26}"
  mseTmpArrPrepareMessage["title_bottom_separator_color_alt"]="${27}"
  mseTmpArrPrepareMessage["title_bottom_separator_colorize"]="${28}"


  mseTmpArrPrepareMessage["body_show"]="${29}"

  mseTmpArrPrepareMessage["body_top_separator_string"]="${30}"
  mseTmpArrPrepareMessage["body_top_separator_color"]="${31}"
  mseTmpArrPrepareMessage["body_top_separator_color_alt"]="${32}"
  mseTmpArrPrepareMessage["body_top_separator_colorize"]="${33}"

  mseTmpArrPrepareMessage["body_first_line_indent"]="${34}"

  mseTmpArrPrepareMessage["body_first_line_bullet"]="${35}"
  mseTmpArrPrepareMessage["body_first_line_bullet_color"]="${36}"
  mseTmpArrPrepareMessage["body_first_line_bullet_color_alt"]="${37}"
  mseTmpArrPrepareMessage["body_first_line_bullet_colorize"]="${38}"

  mseTmpArrPrepareMessage["body_lines_indent"]="${39}"

  mseTmpArrPrepareMessage["body_lines_bullet"]="${40}"
  mseTmpArrPrepareMessage["body_lines_bullet_color"]="${41}"
  mseTmpArrPrepareMessage["body_lines_bullet_color_alt"]="${42}"
  mseTmpArrPrepareMessage["body_lines_bullet_colorize"]="${43}"

  mseTmpArrPrepareMessage["body_lines"]="${44}"
  mseTmpArrPrepareMessage["body_lines_color"]="${45}"
  mseTmpArrPrepareMessage["body_lines_color_alt"]="${46}"
  mseTmpArrPrepareMessage["body_lines_colorize"]="${47}"

  mseTmpArrPrepareMessage["body_bottom_separator_string"]="${48}"
  mseTmpArrPrepareMessage["body_bottom_separator_color"]="${49}"
  mseTmpArrPrepareMessage["body_bottom_separator_color_alt"]="${50}"
  mseTmpArrPrepareMessage["body_bottom_separator_colorize"]="${51}"


  mseTmpArrPrepareMessage["bottom_separator_string"]="${52}"
  mseTmpArrPrepareMessage["bottom_separator_color"]="${53}"
  mseTmpArrPrepareMessage["bottom_separator_color_alt"]="${54}"
  mseTmpArrPrepareMessage["bottom_separator_colorize"]="${55}"






  if [ "${mseTmpArrPrepareMessage[meta_type]}" == "" ]; then
    mseTmpArrPrepareMessage["meta_type"]="n"
  fi



  #
  # Verifica os valores dos parametros que tem uma coleção limitada de opções válidas
  local mseKey
  local mseValue
  for mseKey in "${!mseTmpArrPrepareMessage[@]}"; do
    mseValue="${mseTmpArrPrepareMessage[$mseKey]}"

    case "${mseKey}" in
      meta_type)
        local mseTmp="n"

        case "${mseValue}" in
          i | a | w | e | f | s | fr | or | ca | im)
            mseTmp="${mseValue}"
          ;;
        esac

        mseTmpArrPrepareMessage["meta_type"]="${mseTmp}"
      ;;
      meta_theme)
        if [ "${mseValue}" != "" ] && [ "$(type -t "${mseValue}_message_prepare")" != "function" ]; then
          mseTmpArrPrepareMessage["meta_theme"]=""
        fi
      ;;
      meta_format)
        if [ "${mseValue}" != "" ]; then
          mseTmpArrPrepareMessage["meta_format"]="${mseValue,,}"
        fi
      ;;
      top_separator_colorize | title_show | title_top_separator_colorize | title_bullet_colorize | title_string_colorize | title_bottom_separator_colorize | body_show | body_top_separator_colorize | body_first_line_bullet_colorize | body_lines_bullet_colorize | body_lines_colorize | body_bottom_separator_colorize | bottom_separator_colorize)
        if [ "${mseValue}" == "" ] || ([ "${mseValue}" != "0" ] && [ "${mseValue}" != "1" ]); then
          mseValue="0"
        fi
        mseTmpArrPrepareMessage[$mseKey]="${mseValue}"
      ;;
    esac
  done



  if [ "${mseTmpArrPrepareMessage[meta_theme]}" != "" ]; then
    local mseThemePrepareMessage="${mseTmpArrPrepareMessage[meta_theme]}_message_prepare"
    ${mseThemePrepareMessage} "${1}"
  fi
}
