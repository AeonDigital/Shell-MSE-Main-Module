#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_prepare_interface_progressBar() {
  declare -n mseTmpArrPrepareProgressBar="${1}"

  local mseKey=""
  for mseKey in "${!mseTmpArrPrepareProgressBar[@]}"; do
    unset mseTmpArrPrepareProgressBar["${mseKey}"]
  done


  mseTmpArrPrepareProgressBar["meta_theme"]="${2}"
  mseTmpArrPrepareProgressBar["meta_format"]="${3}"
  mseTmpArrPrepareProgressBar["meta_indent"]="${4}"


  mseTmpArrPrepareProgressBar["bar_ini_string"]="${5}"
  mseTmpArrPrepareProgressBar["bar_end_string"]="${6}"

  mseTmpArrPrepareProgressBar["bar_fill_char"]="${7}"
  mseTmpArrPrepareProgressBar["bar_max_char_length"]="${8}"
  mseTmpArrPrepareProgressBar["bar_atual_progress"]="${9}"

  mseTmpArrPrepareProgressBar["bar_atual_bar_length"]="0"

  mseTmpArrPrepareProgressBar["bar_color"]="${10}"
  mseTmpArrPrepareProgressBar["bar_color_alt"]="${11}"
  mseTmpArrPrepareProgressBar["bar_colorize"]="${12}"


  mseTmpArrPrepareProgressBar["info_show"]="${13}"
  mseTmpArrPrepareProgressBar["info_align"]="${14}"

  mseTmpArrPrepareProgressBar["info_ini_string"]="${15}"
  mseTmpArrPrepareProgressBar["info_end_string"]="${16}"

  mseTmpArrPrepareProgressBar["info_use_percent"]="${17}"
  mseTmpArrPrepareProgressBar["info_data"]="${18}"

  mseTmpArrPrepareProgressBar["info_color"]="${19}"
  mseTmpArrPrepareProgressBar["info_color_alt"]="${20}"
  mseTmpArrPrepareProgressBar["info_colorize"]="${21}"





  local mseKey
  local mseValue
  for mseKey in "${!mseTmpArrPrepareProgressBar[@]}"; do
    mseValue="${mseTmpArrPrepareProgressBar[$mseKey]}"

    case "${mseKey}" in
      meta_theme)
        if [ "${mseValue}" != "" ] && [ "$(type -t "${mseValue}_progressBar_prepare")" != "function" ]; then
          mseTmpArrPrepareProgressBar["meta_theme"]=""
        fi
      ;;
      meta_format)
        if [ "${mseValue}" != "" ]; then
          mseTmpArrPrepareProgressBar["meta_format"]="${mseValue,,}"
        fi
      ;;
      bar_colorize | info_show | info_use_percent | info_colorize)
        if [ "$mseValue" == "" ] || ([ "$mseValue" != "0" ] && [ "$mseValue" != "1" ]); then
          mseValue="0"
        fi
        mseTmpArrPrepareProgressBar[$mseKey]="${mseValue}"
      ;;
      bar_fill_char)
        if [ "${mseValue}" == "" ]; then
          mseTmpArrPrepareProgressBar["bar_fill_char"]="#"
        fi
      ;;
      bar_max_char_length)
        if [ "${mseValue}" == "" ]; then
          mseValue="50"
        else
          local mseCheck=$(mse_is_int "$mseValue")
          if [ "${mseCheck}" == "0" ]; then
            mseValue="50"
          elif [ "${mseValue}" -lt "20" ]; then
            mseValue="20"
          elif [ "${mseValue}" -gt "${COLUMNS}" ]; then
            mseValue="${COLUMNS}"
          fi
        fi
        mseTmpArrPrepareProgressBar["bar_max_char_length"]="${mseValue}"
      ;;
      info_align)
        if [ "${mseValue}" != "l" ] && [ "${mseValue}" != "r" ]; then
          mseValue="r"
        fi
        mseTmpArrPrepareProgressBar["info_align"]="${mseValue}"
      ;;
    esac
  done



  if [ "${mseTmpArrPrepareProgressBar[meta_theme]}" != "" ]; then
    local mseThemePrepareProgressBar="${mseTmpArrPrepareProgressBar[meta_theme]}_progressBar_prepare"
    $mseThemePrepareProgressBar "${1}"
  fi
}
